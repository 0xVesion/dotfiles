local options = {
  number = true,
  shiftwidth = 2,
  signcolumn = "yes",
  wrap = false,
  cursorline = true,
  termguicolors = true,
  path = {"**"},
  wildignorecase = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("colorscheme tokyonight")

