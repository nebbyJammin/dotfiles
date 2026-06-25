local which = {}

which.get_hostname = function()
  local handle = io.popen("hostname")

  if not handle then return "" end

  local hostname = handle:read("*a"):gsub("\n$", "")
  handle:close()
  return hostname
end

return which
