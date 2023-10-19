-- "NOSDuco/remote-sshfs.nvim" lets you connect nvim to a remote ssh
-- connection so that you don't have to instal nvim there.
-- https://github.com/NOSDuco/remote-sshfs.nvim

require('remote-sshfs').setup({})
require('telescope').load_extension 'remote-sshfs'
