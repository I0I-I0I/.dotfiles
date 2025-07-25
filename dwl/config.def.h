/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }
/* appearance */
static const int sloppyfocus               = 0;  /* focus follows mouse */
static const int bypass_surface_visibility = 0;  /* 1 means idle inhibitors will disable idle tracking even if it's surface isn't visible  */
static const int smartgaps                 = 0;  /* 1 means no outer gap when there is only one window */
static const int monoclegaps               = 0;  /* 1 means outer gaps in monocle layout */
static const unsigned int borderpx         = 0;  /* border pixel of windows */
static const unsigned int gappih           = 12; /* horiz inner gap between windows */
static const unsigned int gappiv           = 12; /* vert inner gap between windows */
static const unsigned int gappoh           = 12; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov           = 12; /* vert outer gap between windows and screen edge */
static const float rootcolor[]             = COLOR(0x222222ff);
static const float bordercolor[]           = COLOR(0x44444400);
static const float focuscolor[]            = COLOR(0x777777ff);
static const float urgentcolor[]           = COLOR(0xff0000ff);
/* This conforms to the xdg-protocol. Set the alpha to zero to restore the old behavior */
static const float fullscreen_bg[]         = {0.0f, 0.0f, 0.0f, 1.0f}; /* You can also use glsl colors */

/* tagging - TAGCOUNT must be no greater than 31 */
#define TAGCOUNT (9)

/* logging */
static int log_level = WLR_ERROR;

/* NOTE: ALWAYS keep a rule declared even if you don't use rules (e.g leave at least one example) */
static const Rule rules[] = {
	/* app_id             title       tags mask     isfloating   monitor */
	{ "zen-browser",  NULL,       1 << 0,       0,           -1 },
};

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* monitors */
/* (x=-1, y=-1) is reserved as an "autoconfigure" monitor position indicator
 * WARNING: negative values other than (-1, -1) cause problems with Xwayland clients
 * https://gitlab.freedesktop.org/xorg/xserver/-/issues/899
*/
/* NOTE: ALWAYS add a fallback rule, even if you are completely sure it won't be used */
static const MonitorRule monrules[] = {
	/* name       mfact  nmaster scale layout       rotate/reflect                x    y */
	// { "HDMI-A-1", 0.55f, 1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  100 },
	// { "eDP-1",    0.55f, 1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },

    { NULL,       0.55f, 1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
};

/* keyboard */
static const struct xkb_rule_names xkb_rules[] = {
	{
        .options = "ctrl:nocaps",
		.layout = "us",
	},
	{
        .options = "ctrl:nocaps",
		.layout = "ru",
    },
};

static const int repeat_rate = 35;
static const int repeat_delay = 300;

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 0;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;
/* You can choose between:
LIBINPUT_CONFIG_SCROLL_NO_SCROLL
LIBINPUT_CONFIG_SCROLL_2FG
LIBINPUT_CONFIG_SCROLL_EDGE
LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN
*/
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;

/* You can choose between:
LIBINPUT_CONFIG_CLICK_METHOD_NONE
LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS
LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER
*/
static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;

/* You can choose between:
LIBINPUT_CONFIG_SEND_EVENTS_ENABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE
*/
static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;

/* You can choose between:
LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT
LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE
*/
static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE;
static const double accel_speed = -0.5;

/* You can choose between:
LIBINPUT_CONFIG_TAP_MAP_LRM -- 1/2/3 finger tap maps to left/right/middle
LIBINPUT_CONFIG_TAP_MAP_LMR -- 1/2/3 finger tap maps to left/middle/right
*/
static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;

/* If you want to use the windows key for MODKEY, use WLR_MODIFIER_LOGO */
#define MODKEY WLR_MODIFIER_LOGO

#define TAGKEYS(KEY,SKEY,TAG) \
	{ MODKEY,                    KEY,            view,            {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL,  KEY,            toggleview,      {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_SHIFT, SKEY,           tag,             {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL|WLR_MODIFIER_SHIFT,SKEY,toggletag, {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[] = { "ghostty", NULL };
static const char *menucmd[] = { "wmenu-run", "-i", "-f", "'Maple Mono CN' Normal 16", NULL };
static const char *browsercmd[] = { "zen", NULL };
static const char *qutebrowsercmd[] = { "qutebrowser", NULL };
static const char *waybarcmd[] = { "toggle-waybar", NULL };
static const char *musiccmd[] = { "spotify", "--enable-features=UseOzonePlatform", "--ozone-platform=wayland", NULL };
static const char *lockscrencmd[] = { "waylock", "-init-color", "0x111111", "-input-color", "0x666666", "-fail-color", "0x6C4141", NULL };
static const char *colorpickercmd[] = { "hyprpicker", "-a", "-r", NULL };
static const char *explorecmd[] = { "foot", "-e", "yazi", NULL };
static const char *wallpapercmd[] = { "waypaper", NULL };
static const char *emacscmd[] = { "emacsclient", "-s", "doom", "-c", NULL};

static const Key keys[] = {
	/* modifier                  key                 function        argument */
    { MODKEY,                    XKB_KEY_c,          spawn,          SHCMD("screenshot region") },
    { MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_c,          spawn,          SHCMD("screenshot window") },
    { MODKEY|WLR_MODIFIER_ALT,   XKB_KEY_c,          spawn,          SHCMD("screenshot all") },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_V,          spawn,          SHCMD("vpn tog") },
    { MODKEY,                    XKB_KEY_v,          spawn,          SHCMD("cliphist list | wmenu -i -f 'Maple Mono CN 12' -l 30 | cliphist decode | wl-copy") },

    { MODKEY,                    XKB_KEY_e,          spawn,          {.v = explorecmd } },
    { MODKEY|WLR_MODIFIER_ALT,   XKB_KEY_Return,     spawn,          {.v = emacscmd } },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_P,          spawn,          {.v = wallpapercmd } },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_C,          spawn,          {.v = colorpickercmd } },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_L,          spawn,          {.v = lockscrencmd} },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_M,          spawn,          {.v = musiccmd} },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_B,          spawn,          {.v = browsercmd} },
    { MODKEY|WLR_MODIFIER_ALT,   XKB_KEY_b,          spawn,          {.v = qutebrowsercmd} },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Return,     spawn,          {.v = termcmd} },
    { MODKEY,                    XKB_KEY_b,          spawn,          {.v = waybarcmd} },
    { MODKEY,                    XKB_KEY_p,          spawn,          {.v = menucmd} },

    { MODKEY,                    XKB_KEY_j,          focusstack,     {.i = +1} },
    { MODKEY,                    XKB_KEY_k,          focusstack,     {.i = -1} },
    { MODKEY,                    XKB_KEY_i,          incnmaster,     {.i = +1} },
    { MODKEY,                    XKB_KEY_d,          incnmaster,     {.i = -1} },
    { MODKEY,                    XKB_KEY_h,          setmfact,       {.f = -0.05f} },
    { MODKEY,                    XKB_KEY_l,          setmfact,       {.f = +0.05f} },

    { MODKEY,                    XKB_KEY_Down,       moveresizekb,   {.v = (int []){ 0, 40, 0, 0 }}},
    { MODKEY,                    XKB_KEY_Up,         moveresizekb,   {.v = (int []){ 0, -40, 0, 0 }}},
    { MODKEY,                    XKB_KEY_Right,      moveresizekb,   {.v = (int []){ 40, 0, 0, 0 }}},
    { MODKEY,                    XKB_KEY_Left,       moveresizekb,   {.v = (int []){ -40, 0, 0, 0 }}},
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Down,       moveresizekb,   {.v = (int []){ 0, 0, 0, 40 }}},
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Up,         moveresizekb,   {.v = (int []){ 0, 0, 0, -40 }}},
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Right,      moveresizekb,   {.v = (int []){ 0, 0, 40, 0 }}},
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Left,       moveresizekb,   {.v = (int []){ 0, 0, -40, 0 }}},

    { MODKEY,                    XKB_KEY_space,      incxkbrules,    {.i = +1} },
    { MODKEY,                    XKB_KEY_Return,     zoom,           {0} },
    { MODKEY,                    XKB_KEY_Tab,        view,           {0} },
    { MODKEY,                    XKB_KEY_g,          togglegaps,     {0} },
    { MODKEY,                    XKB_KEY_q,          killclient,     {0} },
    { MODKEY,                    XKB_KEY_t,          setlayout,      {.v = &layouts[0]} },
    { MODKEY,                    XKB_KEY_f,          setlayout,      {.v = &layouts[1]} },
    { MODKEY,                    XKB_KEY_m,          setlayout,      {.v = &layouts[2]} },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_space,      togglefloating, {0} },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_E,          togglefullscreen, {0} },
    { MODKEY,                    XKB_KEY_0,          view,           {.ui = ~0} },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_parenright, tag,            {.ui = ~0} },
    { MODKEY,                    XKB_KEY_comma,      focusmon,       {.i = WLR_DIRECTION_LEFT} },
    { MODKEY,                    XKB_KEY_period,     focusmon,       {.i = WLR_DIRECTION_RIGHT} },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_less,       tagmon,         {.i = WLR_DIRECTION_LEFT} },
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_greater,    tagmon,         {.i = WLR_DIRECTION_RIGHT} },
    TAGKEYS(          XKB_KEY_1, XKB_KEY_exclam,                     0),
    TAGKEYS(          XKB_KEY_2, XKB_KEY_at,                         1),
    TAGKEYS(          XKB_KEY_3, XKB_KEY_numbersign,                 2),
    TAGKEYS(          XKB_KEY_4, XKB_KEY_dollar,                     3),
    TAGKEYS(          XKB_KEY_5, XKB_KEY_percent,                    4),
    TAGKEYS(          XKB_KEY_6, XKB_KEY_asciicircum,                5),
    TAGKEYS(          XKB_KEY_7, XKB_KEY_ampersand,                  6),
    TAGKEYS(          XKB_KEY_8, XKB_KEY_asterisk,                   7),
    TAGKEYS(          XKB_KEY_9, XKB_KEY_parenleft,                  8),
    { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Q,          quit,           {0} },

    /* Ctrl-Alt-Backspace and Ctrl-Alt-Fx used to be handled by X server */
    { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_Terminate_Server, quit, {0} },
    /* Ctrl-Alt-Fx is used to switch to another VT, if you don't know what a VT is
     * do not remove them.
     */
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
    CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
    CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

static const Button buttons[] = {
	{ MODKEY, BTN_LEFT,   moveresize,     {.ui = CurMove} },
	{ MODKEY, BTN_MIDDLE, togglefloating, {0} },
	{ MODKEY, BTN_RIGHT,  moveresize,     {.ui = CurResize} },
};

