function fimg
  # Find images with fd (fast) or find (fallback)
  if command -v fd > /dev/null
    set cmd "fd --type f -e jpg -e jpeg -e png -e gif -e webp"
  else
    set cmd "find . -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.webp' \)"
  end

  # Preview with Sixel (works natively in Foot)
  set preview_cmd "img2sixel -w 800 -q low {} 2>/dev/null || echo 'Preview failed'"

  # Run fzf with Sixel preview
  eval $cmd | fzf \
    --preview="$preview_cmd" \
    --preview-window="right:50%"
end
