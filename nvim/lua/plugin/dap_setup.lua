local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '"D:\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe"',
  options = {
    detached = false
  }
}

dap.adapters.python = {
  type = 'executable';
  command = 'D:\Python\Lib\site-packages\debugpy';
  args = { '-m', 'debugpy.adapter' };
}
 dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
  },
}
