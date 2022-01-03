local ok, rss = pcall(require, "nvim-rss")
if not ok then
  return
end

rss.setup({
  feeds_dir = "/home/pritesh/.config/nvim",
})

vim.cmd [=[
  command! OpenRssView lua require("nvim-rss").open_feeds_tab()
  command! FetchFeed lua require("nvim-rss").fetch_feed()
  command! FetchAllFeeds lua require("nvim-rss").fetch_all_feeds()
  command! ViewFeed lua require("nvim-rss").view_feed()
  command! -nargs=1 ImportOpml lua require("nvim-rss").import_opml(<args>)
]=]
