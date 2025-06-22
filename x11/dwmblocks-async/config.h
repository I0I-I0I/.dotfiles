#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER "  "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// X("", "~/apps/dwmblocks/scripts/date.sh",        60,      8)
// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)                                                \
    X("", "~/.dotfiles/x11/dwmblocks-async/scripts/clock.sh",       60,      1) \
    X("", "~/.dotfiles/x11/dwmblocks-async/scripts/brightness.sh",   5,      2) \
    X("", "~/.dotfiles/x11/dwmblocks-async/scripts/volume.sh",       5,      3) \
    X("", "~/.dotfiles/x11/dwmblocks-async/scripts/bluetooth.sh",    0,      4) \
    X("", "~/.dotfiles/x11/dwmblocks-async/scripts/network.sh",      0,      5) \
    X("", "~/.dotfiles/x11/dwmblocks-async/scripts/vpn.sh",          5,      6) \
    X("", "~/.dotfiles/x11/dwmblocks-async/scripts/battery.sh",     10,      7)

#endif  // CONFIG_H
