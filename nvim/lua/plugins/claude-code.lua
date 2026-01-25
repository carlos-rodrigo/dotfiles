return {
  {
    "carlos-rodrigo/claude-code.nvim", -- Path to your local clone of the plugin
    dir = "~/Developer/claude-code.nvim",
    build = false,
    config = function()
      require("claude-code").setup({
        -- Intelligence service configuration
        intelligence = {
          enabled = true, -- Enable the intelligence features
          service_url = "http://localhost:7345", -- Backend URL
          auto_compress = true, -- Auto-compress large sessions
          compression_threshold_kb = 100, -- Compress sessions larger than 100KB
        },

        -- Your other options
        save_session = true,
        auto_save_session = true,
      })
    end,
  },
}
