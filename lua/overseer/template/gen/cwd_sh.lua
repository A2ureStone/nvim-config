local files = require("overseer.files")

local function get_shell_scripts(dir)
  return vim.tbl_filter(function(filename)
    return filename:match("%.sh$")
  end, files.list_files(dir))
end

return {
  condition = {
    callback = function(opts)
      if #get_shell_scripts(opts.dir) == 0 then
        return false, "No shell scripts found"
      end
      return true
    end,
  },
  generator = function(opts, cb)
    local scripts = get_shell_scripts(opts.dir)
    assert(#scripts > 0)
    local ret = {}
    for _, filename in ipairs(scripts) do
      table.insert(ret, {
        name = filename,
        params = {
          args = { optional = true, type = "list", delimiter = " " },
        },
        builder = function(params)
          return {
            cmd = { files.join(opts.dir, filename) },
            args = params.args,
          }
        end,
      })
    end
    cb(ret)
  end,
}
