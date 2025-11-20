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
(setq my/light-theme 'doom-oksolar-light)
(setq my/dark-theme 'doom-oksolar-dark)
(setq doom-theme my/dark-theme)

;; Set function to create new keybinding
(defun my/toggle-theme ()
  (interactive)
  (if (eq doom-theme my/dark-theme)
     (progn
       (setq doom-theme my/light-theme)
       (disable-theme my/dark-theme)
       (load-theme my/light-theme))
     (progn
       (setq doom-theme my/dark-theme)
       (disable-theme my/light-theme)
       (load-theme my/dark-theme))))

(map! :leader
      (:prefix ("t" . "toggle")
               :desc "Toggle theme" "T" #'my/toggle-theme))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq doom-font
      (cl-find-if #'doom-font-exists-p
                  '("Iosevka-14")))
                  ;; '("Monaspace Xenon-13")))
(setq doom-variable-pitch-font
      (cl-find-if #'doom-font-exists-p
                  '("Iosevka Aile-14")))

;; Auto save org buffers
(add-hook 'auto-save-hook 'org-save-all-org-buffers)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/orgfiles/")
(setq org-agenda-files '("~/orgfiles/"))
(setq org-default-notes-file "~/orgfiles/refile.org")

(after! org
  (setq org-log-into-drawer "NOTES")
  (setq org-clock-into-drawer "LOGBOOK")
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "PROJ(p)" "|" "DONE(d!)" "CANC(c@)" "DELE(e)")))
  (setq org-agenda-sorting-strategy
        '(habit-down time-up urgency-down todo-state-down category-keep))
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
  (setq org-agenda-span 'day)
  (setq org-agenda-start-day nil)
  (setq org-export-with-toc nil)
  (setq org-duration-format (quote h:mm))
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
           "**** TODO %? %T :meeting:"
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

  ;; Global column properties and format
  (setq org-global-properties
        '(("Effort_ALL" . "0:05 0:15 0:30 1:00 2:00 3:00 4:00 5:00 6:00 8:00")))
  (setq org-columns-default-format-for-agenda "%40ITEM(Task) %4TODO(Todo) %1PRIORITY(Priority) %8EFFORT(Effort){:} %DEADLINE(Deadline) %10TAGS(Tags)")

  ;; Remove background color from column view
  (custom-set-faces
   '(org-column ((t (:background nil)))))

  ;; Unbind 'g' from org-columns-map (keep 'r' for refresh)
  (with-eval-after-load 'org-colview
    (define-key org-columns-map "g" nil))

  ;; Custom agenda view with column mode and weekly span
  (setq org-agenda-custom-commands
        '(("p" "Planning Agenda"
           ((agenda ""
                    ((org-agenda-span 7)                    ; 1 week span
                     (org-agenda-skip-deadline-prewarning-if-scheduled t)
                     (org-deadline-warning-days 0)          ; Only show deadlines on due date
                     )))
           ((org-agenda-compact-blocks t)
            (org-agenda-start-with-log-mode nil)   ; Don't show log mode
            (org-agenda-view-columns-initially t)))
          ("r" "Review Agenda"
           ((agenda ""
                    ((org-agenda-span 7)                    ; 1 week span
                     (org-agenda-start-day "-3d")           ; Start 3 days ago
                     )))
           ((org-agenda-compact-blocks t)))))
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
