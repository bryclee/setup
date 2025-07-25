;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/orgfiles/")
(setq org-agenda-files (directory-files-recursively "~/orgfiles/" "\\.org$"))
(setq org-default-notes-file "~/orgfiles/refile.org")

(after! org
  (setq org-log-into-drawer 't)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAITING(w@/!)" "PROJ(p)" "|" "DONE(d!)" "CANCELED(c@)" "DELEGATED(e)")))
  (setq org-agenda-sorting-strategy
        '(habit-down time-up todo-state-down urgency-down category-keep))
  (setq org-agenda-clockreport-parameter-plist '(:link t :maxlevel 4))
  (setq org-agenda-start-with-log-mode t)
  (setq org-modern-fold-stars
        ; Swap 2bc8 to 23f5, both are black right triangle. Not sure why 2bc8 is being used.
        '(("▶" . "▼") ("▷" . "▽") ("⏵" . "⏷") ("▹" . "▿") ("▸" . "▾")))
  (setq org-complete-tags-always-offer-all-agenda-tags t)
  ;; (setq org-hide-emphasis-markers t)
  ;; (setq org-blank-before-new-entry
  ;;       '((heading . nil)
  ;;         (plain-list-item . nil)))
  ;; (setq org-agenda-span 'day)
  ;; (setq org-agenda-start-on-weekday nil)
  ;; (setq org-startup-indented t)
  (setq org-capture-templates
        '(("t" "Task" entry
           (file+olp+datetree "~/orgfiles/refile.org")
           "* TODO %?\n%U"
           :tree-type month)
          ("f" "Follow-up Task" entry
           (file+olp+datetree "~/orgfiles/refile.org")
           "* TODO %?\n%U\nFollow up from: %a"
           :tree-type month)
          ("i" "Interrupting Task" entry
           (file+olp+datetree "~/orgfiles/refile.org")
           "* TODO %?\n%U\n"
           :clock-in t
           :clock-resume t
           :tree-type month)
          ("r" "Review" entry
           (file+olp+datetree "~/orgfiles/reviews.org")
           "* TODO Review %? :prreview:\n%U"
           :tree-type month)
          ("j" "Journal" entry
           (file+olp+datetree "~/orgfiles/journal.org")
           "**** TODO %T %?"
           :clock-in t
           :clock-resume t)
          ("s" "Standup" entry
           (file+olp+datetree "~/orgfiles/journal.org")
           "**** Standup %T
- Previous day
  - %?
- Today
  -
- Unexpected
  -
- Blockers
  -
- Spillover
  - "
           :clock-in t
           :clock-resume t
           )))
  (setq org-id-link-to-org-use-id t)
  (setq org-clock-idle-time 15)
  )

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
