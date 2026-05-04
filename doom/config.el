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
               :desc "Toggle theme" "T" #'my/toggle-theme)
      (:prefix ("o" . "open")
               (:prefix ("s" . "send to application")
                        :desc "Open in Wezterm" "w" #'+macos/open-in-wezterm)))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq doom-font
      (cl-find-if #'doom-font-exists-p
                  '("M PLUS 1 Code-14" "Iosevka-14")))
                  ;; '("JetBrains Mono-13")))
                  ;; '("Monaspace Xenon-13")))
(setq doom-variable-pitch-font
      (cl-find-if #'doom-font-exists-p
                  '("M PLUS 1-14" "Iosevka Aile-14")))

;; Auto save org buffers
(add-hook 'auto-save-hook 'org-save-all-org-buffers)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/orgfiles/")
(setq org-agenda-files '("~/orgfiles/"))
(setq org-default-notes-file "~/orgfiles/refile.org")
(setq-default doom-scratch-initial-major-mode 'org-mode)

(after! org
  (setq org-log-into-drawer "NOTES")
  (setq org-clock-into-drawer "LOGBOOK")
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "REVW(r@/!)" "PROJ(p)" "|" "DONE(d!)" "CANC(c@)" "DELE(e@)")))
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
*Previous day*
- %?
*Today*
-
*Unexpected*
-
*Blockers*
-
*Spillover*
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

  ;; Functions to navigate between org-super-agenda groups
  (defun my/org-agenda-next-super-agenda-group ()
    "Jump to the next org-super-agenda group header."
    (interactive)
    (let ((start (point)))
      (forward-line 1)
      (while (and (not (eobp))
                  (not (get-text-property (point) 'org-super-agenda-header)))
        (forward-line 1))
      (if (eobp)
          (progn
            (goto-char start)
            (message "No next group"))
        (beginning-of-line))))

  (defun my/org-agenda-prev-super-agenda-group ()
    "Jump to the previous org-super-agenda group header."
    (interactive)
    (let ((start (point)))
      (forward-line -1)
      (while (and (not (bobp))
                  (not (get-text-property (point) 'org-super-agenda-header)))
        (forward-line -1))
      (if (bobp)
          (progn
            (goto-char start)
            (message "No previous group"))
        (beginning-of-line))))

  ;; org-super-agenda configuration
  (use-package! org-super-agenda
    :after org-agenda
    :config
    (org-super-agenda-mode)
    (setq org-super-agenda-header-map nil)  ; Use default agenda keybindings on headers

    ;; Add keybindings for group navigation
    (map! :map org-agenda-mode-map
          "C-M-j" #'my/org-agenda-next-super-agenda-group
          "C-M-k" #'my/org-agenda-prev-super-agenda-group)

    (setq org-super-agenda-groups
          '(
            (:name "Today"
             :time-grid t
             :order 1)
            (:name "Next Actions"
             :todo "NEXT"
             :order 2)
            (:name "In Review"
             :todo "REVW"
             :order 3)
            (:name "Waiting"
             :todo "WAIT"
             :order 7)
            (:name "Scheduled"
             :scheduled today
             :order 4)
            (:name "Due Soon"
             :deadline future
             :order 5)
            (:name "Overdue"
             :deadline past
             :scheduled past
             :order 6)
            (:name "Scheduled"
             :scheduled future
             :order 8)
            (:name "Projects"
             :todo "PROJ"
             :order 9)
            )))
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

;; Open directory in Wezterm
(defun +macos/open-in-wezterm ()
  "Open current directory in a new Wezterm window."
  (interactive)
  (let* ((current-file (if (derived-mode-p 'dired-mode)
                           (dired-get-file-for-visit)
                         (buffer-file-name)))
         (path (expand-file-name
                (if current-file
                    (file-name-directory current-file)
                  default-directory))))
    (message "Opening in Wezterm: %s" path)
    (start-process "wezterm" nil "wezterm" "start" "--cwd" path)))
