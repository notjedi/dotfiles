vim.g.vimwiki_list = {
  {
    path = '/mnt/Seagate/Code/vimwiki/',
    syntax = 'markdown',
    ext = '.md',
    auto_toc = 1,
    custom_wiki2html = '$GOPATH/bin/vimwiki-godown',
    custom_wiki2html_args = 'vimwiki/',
  },
}

vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_listsyms = '✗○◐●✓'
vim.g.vimwiki_listsym_rejected = '✗'
vim.vimwiki_table_auto_fmt = 1
-- vimwiki_key_mappings = { 'all_maps': 0, }
