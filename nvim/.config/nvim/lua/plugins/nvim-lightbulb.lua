-- https://github.com/kosayoda/nvim-lightbulb#configuration
return {
  "kosayoda/nvim-lightbulb",
  config = function()
    require("nvim-lightbulb").setup(
      {
        autocmd = {enabled = true}
      }
    )
  end
}
