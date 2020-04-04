local function file_exists(path)
  local file = io.open(path, "rb")
  if file then file:close() end
  return file ~= nil
end
function decodeURI(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end

function encodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end
path = decodeURI(ngx.var.file_path);
if not file_exists(path) then
    ngx.say("file not found: "..path)
end
r, err = os.remove(path)
if not r then
    ngx.say("failed to delete: "..err)
else
    ngx.say("delete successfully!")
end