" Visual line navigation
nmap j gj
nmap k gk

" Back and forward navigation
exmap back obcommand app:go-back
nmap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nmap <C-i> :forward<CR>

" Use Space directly in mappings
" We unmap it first to prevent default behavior
unmap <Space>

" Close current file/tab
exmap close obcommand workspace:close
nmap <Space>c :close<CR>

" Window splitting and closing
exmap splitVertical obcommand workspace:split-vertical
nmap <C-w>v :splitVertical<CR>
exmap splitHorizontal obcommand workspace:split-horizontal
nmap <C-w>s :splitHorizontal<CR>
nmap <C-w>q :close<CR>
nmap <C-w>c :close<CR>
nmap <C-w>o :closeOthers<CR>

" Window navigation
exmap focusLeft obcommand editor:focus-left
nmap <C-w>h :focusLeft<CR>
exmap focusRight obcommand editor:focus-right
nmap <C-w>l :focusRight<CR>
exmap focusTop obcommand editor:focus-top
nmap <C-w>k :focusTop<CR>
exmap focusBottom obcommand editor:focus-bottom
nmap <C-w>j :focusBottom<CR>

" Next and previous link
nmap ]l gl
nmap [l gL

" Sidebar toggles
exmap toggleLeftSidebar obcommand app:toggle-left-sidebar
nmap <Space>tl :toggleLeftSidebar<CR>
exmap toggleRightSidebar obcommand app:toggle-right-sidebar
nmap <Space>tr :toggleRightSidebar<CR>

" View commands
exmap showExplorer obcommand file-explorer:open
nmap <Space>e :showExplorer<CR>
exmap showBacklinks obcommand backlink:open
nmap <Space>vb :showBacklinks<CR>
exmap showOutgoingLinks obcommand outgoing-link:open
nmap <Space>vB :showOutgoingLinks<CR>
exmap showOutline obcommand outline:open
nmap <Space>vn :showOutline<CR>

" Daily notes
exmap daily obcommand daily-notes
nmap gh :daily<CR>

" Folding
exmap togglefold obcommand editor:toggle-fold
nmap za :togglefold<CR>
exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>
exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>
exmap foldless obcommand editor:fold-less
nmap zo :foldless<CR>
exmap foldmore obcommand editor:fold-more
nmap zc :foldmore<CR>

" Open Agenda (Requires JS commands enabled)
" exmap agenda jscommand { app.workspace.openLinkText("Agenda.md", "") }
" nmap ga :agenda<CR>
