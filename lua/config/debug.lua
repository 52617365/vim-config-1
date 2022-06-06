-- require("dapui").setup()
-- require("nvim-dap-virtual-text").setup()
-- require('telescope').load_extension('dap')
-- local dap = require("dap")
--
-- -- RUST
-- dap.adapters.lldb = {
--   type = 'executable',
--   command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
--   name = 'lldb'
-- }
--
-- dap.configurations.rust = {
--   {
--     name = 'Launch',
--     type = 'lldb',
--     request = 'launch',
--     program = "${file}",
--     -- program = function()
--     --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     -- end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
--
--     -- 💀
--     -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--     --
--     --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--     --
--     -- Otherwise you might get the following error:
--     --
--     --    Error on launch: Failed to attach to the target process
--     --
--     -- But you should be aware of the implications:
--     -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--     -- runInTerminal = false,
--   },
-- }
-- -- RUST END
--
--
-- -- NODE.JS
-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = {os.getenv('HOME') .. '/debug/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
-- }
-- dap.configurations.javascript = {
--   {
--     name = 'Launch',
--     type = 'node2',
--     request = 'launch',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
--   {
--     -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     processId = require'dap.utils'.pick_process,
--   },
-- }
-- -- NODE.JS END
--
--
-- -- CHROME JS
-- dap.adapters.chrome = {
--     type = "executable",
--     command = "node",
--     args = {os.getenv("HOME") .. "/debug/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
-- }
--
-- dap.configurations.javascriptreact = { -- change this to javascript if needed
--     {
--         type = "chrome",
--         request = "attach",
--         program = "${file}",
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = "inspector",
--         port = 9222,
--         webRoot = "${workspaceFolder}"
--     }
-- }
--
-- dap.configurations.typescriptreact = { -- change to typescript if needed
--     {
--         type = "chrome",
--         request = "attach",
--         program = "${file}",
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = "inspector",
--         port = 9222,
--         webRoot = "${workspaceFolder}"
--     }
-- }
-- -- CHROME JS END
--
-- local dapui = require("dapui")
-- -- makes dapui open instantly when dap opens.
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end