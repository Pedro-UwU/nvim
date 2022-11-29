require("pedro")
print("Hello from root")

require'lspconfig'.pylsp.setup{}
require'lspconfig'.bashls.setup{}
--require'lspconfig'.yaml-language-server.setup{}
require'lspconfig'.tsserver.setup {}

