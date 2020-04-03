local function file_exists(path)
  local file = io.open(path, "rb")
  if file then file:close() end
  return file ~= nil
end
if not file_exists(ngx.var.file_path) then
    ngx.say("file not found: "..ngx.var.file_path)
end
r, err = os.remove(ngx.var.file_path)
if not r then
    ngx.say("failed to delete: "..err)
else
    ngx.say("delete successfully!")
end