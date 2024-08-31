return {
  "vhyrro/luarocks.nvim",
  priority = 2000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  opts = {
    rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim" }
  }
}
