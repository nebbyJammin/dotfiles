---@diagnostic disable: undefined-global

hl.on("hyprland.start", function()
  -- Wallpaper
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("waypaper --restore")

  -- AGS
  hl.exec_cmd("ags run")
end)
