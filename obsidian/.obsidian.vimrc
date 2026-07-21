" Visual line navigation
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

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
exmap closeTabGroup obcommand workspace:close-tab-group
nmap <C-w>c :closeTabGroup<CR>
nmap <C-w>q :closeTabGroup<CR>
exmap closeOthers obcommand workspace:close-others
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

" Task status symbols
exmap taskStatusInProgress obcommand obsidian-tasks-plugin:set-status-symbol-to-/
nmap <Space>tsi :taskStatusInProgress<CR>
exmap taskStatusCancelled obcommand obsidian-tasks-plugin:set-status-symbol-to--
nmap <Space>tsc :taskStatusCancelled<CR>

" View commands
exmap showExplorer obcommand notebook-navigator:open
nmap <Space>e :showExplorer<CR>
exmap revealFile obcommand notebook-navigator:reveal-file
nmap <Space>E :revealFile<CR>
exmap showBacklinks obcommand backlink:open
nmap <Space>vb :showBacklinks<CR>
exmap showOutgoingLinks obcommand outgoing-link:open
nmap <Space>vB :showOutgoingLinks<CR>
exmap showOutline obcommand outline:open
nmap <Space>vn :showOutline<CR>

" Daily notes
exmap daily obcommand daily-notes
nmap <Space>gh :daily<CR>
exmap gotoPrev obcommand daily-notes:goto-prev
nmap <Space>gp :gotoPrev<CR>
exmap gotoNext obcommand daily-notes:goto-next
nmap <Space>gn :gotoNext<CR>

" Notebook navigator periodic notes
exmap nnWeekly obcommand notebook-navigator:open-weekly-note
nmap <Space>gw :nnWeekly<CR>
exmap nnMonthly obcommand notebook-navigator:open-monthly-note
nmap <Space>gm :nnMonthly<CR>
exmap nnQuarterly obcommand notebook-navigator:open-quarterly-note
nmap <Space>gq :nnQuarterly<CR>
exmap nnYearly obcommand notebook-navigator:open-yearly-note
nmap <Space>gy :nnYearly<CR>

" New unique note
exmap newUniqueNote obcommand zk-prefixer
nmap <Space>nn :newUniqueNote<CR>

" Omnisearch in-file
exmap omnisearchInFile obcommand omnisearch:show-modal-infile
nmap <Space>sn :omnisearchInFile<CR>

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

" Notebook navigator shortcuts
exmap gotoShortcut1 obcommand notebook-navigator:open-shortcut-1
nmap <Space>g1 :gotoShortcut1<CR>
exmap gotoShortcut2 obcommand notebook-navigator:open-shortcut-2
nmap <Space>g2 :gotoShortcut2<CR>
exmap gotoShortcut3 obcommand notebook-navigator:open-shortcut-3
nmap <Space>g3 :gotoShortcut3<CR>
exmap gotoShortcut4 obcommand notebook-navigator:open-shortcut-4
nmap <Space>g4 :gotoShortcut4<CR>
exmap gotoShortcut5 obcommand notebook-navigator:open-shortcut-5
nmap <Space>g5 :gotoShortcut5<CR>

vmap <Space>k c[]()<Esc>P`<
nmap <Space>k A)<Esc>Bi[](<Esc>hi

" Open Agenda (Requires JS commands enabled)
" exmap agenda jscommand { app.workspace.openLinkText("Agenda.md", "") }
" nmap ga :agenda<CR>
