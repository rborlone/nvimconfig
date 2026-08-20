-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ===========================================================================
-- Atajos estilo VSCode (adicionales; no reemplazan los <leader>-based de LazyVim)
-- ===========================================================================
local map = vim.keymap.set

-- Ctrl+P: Quick Open (buscar archivo por nombre)
map("n", "<C-p>", function() LazyVim.pick("files")() end, { desc = "Quick Open (Files)" })

-- Ctrl+Shift+P: Command Palette
map("n", "<C-S-p>", function() Snacks.picker.commands() end, { desc = "Command Palette" })

-- Ctrl+Shift+F: Search in Files (grep en todo el proyecto)
map("n", "<C-S-f>", function() LazyVim.pick("live_grep")() end, { desc = "Search in Files" })

-- Ctrl+B / Ctrl+Shift+E: Toggle Explorer (sidebar de archivos)
map("n", "<C-b>", function() Snacks.explorer({ cwd = LazyVim.root() }) end, { desc = "Toggle Explorer" })
map("n", "<C-S-e>", function() Snacks.explorer({ cwd = LazyVim.root() }) end, { desc = "Toggle Explorer" })

-- Ctrl+Shift+O: Go to Symbol in File
map("n", "<C-S-o>", function() Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter }) end, { desc = "Go to Symbol in File" })

-- Ctrl+T: Go to Symbol in Workspace
map("n", "<C-t>", function() Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter }) end, { desc = "Go to Symbol in Workspace" })

-- F12 / Shift+F12 / Ctrl+F12: navegación LSP (igual a gd/gr/gI, con las teclas de VSCode)
map("n", "<F12>", function() Snacks.picker.lsp_definitions() end, { desc = "Go to Definition" })
map("n", "<S-F12>", function() Snacks.picker.lsp_references() end, { desc = "Go to References" })
map("n", "<C-F12>", function() Snacks.picker.lsp_implementations() end, { desc = "Go to Implementation" })

-- F2: Rename Symbol
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- Ctrl+G: Go to Line (abre la línea de comandos, escribe el número y Enter)
map("n", "<C-g>", ":", { desc = "Go to Line...", silent = false })

-- Alt+Left / Alt+Right: Go Back / Go Forward (salto entre posiciones del jumplist)
map("n", "<A-Left>", "<C-o>", { desc = "Go Back" })
map("n", "<A-Right>", "<C-i>", { desc = "Go Forward" })

-- Ctrl+Tab / Ctrl+Shift+Tab: cambiar entre buffers (como tabs de editor en VSCode)
map("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "Next Editor Tab" })
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous Editor Tab" })
