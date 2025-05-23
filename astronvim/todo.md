# Customizations

Running list of items to configure for `astronvim` to make it work the way I'd like

- [x] Something funny going on with caching views, in particular with JSON files
  - foldmethod is cached as diff
  - fold level does not update when using `zm`, `zr`, so cannot unfold one level at a time
  - ~This maybe has to do with the `resession` plugin?~
  - `autoview` option
- [x] fzf-lua
  - [x] `grr` (go to references) should also use FZF lua
  - [x] `<leader>f/` should use fuzzy search instead of grep
  - [x] `<leader>lG` (search workspace symbols) should use livegrep instead of fuzzy search by default, as fuzzy search runs into some issues
- neo-tree
  - See if there are different options for neotree filter behavior
  - [x] Would prefer not to filter into folders by default when using `/`
  - [x] Enable fuzzy finder on `f` instead
  - [ ] Would prefer fuzzy finder to accept filter on Enter instead of selecting the file
  - [x] Do not chdir on neotree, enable binding for `-`
  - [ ] Align the neotree split mappings to the telescope/fzf ones
  - [x] It is a bit funny, it tends to reset back to the current dir very often depending on what keybinds are pressed (eg. `H` to show hidden files)
    - Enabled hidden files by default, as this was the most common thing being toggled
- [x] Can I use FZF syntax/search instead of telescope?
  - Search by file as well as name
  - Used to the FZF seach syntax, seems to be more flexible
- git
  - Added git-fugitive for blame and browse commands
  - [x] Update mappings
    - <leader>gb for blame
    - <leader>gB can be for branch
    - <leader>go for browse (needs to work in visual mode as well)
      - Similar to how neogit adds mappings to git menu when loaded
  - pull request review
    - [x] `gf` should ideally open in new tab which cursor on same location, so that we can go and do our lookup, then close the tab to return back to the pull request review
    - [ ] I don't know why, when going into a comment thread, the scroll position of the window is changed
  - [x] Once `gitsigns` is updated, no longer need fugitive for blame. Still need it for browse, but at that point I can maybe install a different plugin instead
    - This was updated, but decided to keep fugitive for consistency. Also allows for opening blames in Github.
- [x] Hide bufferline, only want to show tabs
  - Mixed, this might be useful to keep. Buffers are tagged to the tabs they were spawned in, which is interesting for keeping track
  - This is also very complicated to update, don't want to waste too much time on this ultimately cosmetic issue
  - If you close the tab, the buffers do stay open, but they don't show up in the bufferline of the other tabs
  - If I do keep this, I would prefer to have tabs on the left, and buffers on the right
- [c] GraphQL language server doesn't seem to be working
  - Seems like this is working now
- [c] Add neorg
  - Doesn't install easily on Mac, don't want to spend the effort to figure it out
- [x] Set norelativenumber
- [x] Add <c-f> mapping
- [x] Set `wildoptions`
- [x] Surround plugin?
- [x] How to optionally disable formatter
  - `<leader>uf` when the buffer has formatting enabled

## Orgmode

- [ ] Mapping to next/previous paragraph (`{`) overridden by mapping for navigating to next header
- [ ] promote/demote headline does not shift cursor proper
- [x] Insert headline (`<Leader>oih`) would be more helpful if it respected whitespace. It adds a newline before the headline by default, but personally I always already have this added for formatting.
  - Switched to option to not use whitespace instead
- [x] Add wrap by default for orgmode files, for readability
- [ ] Fix blink command line completion integration

## Extra

- [ ] FZF + orgmode, similar to the telescope plugin
