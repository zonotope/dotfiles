;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; behavior                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-directory "~/docs/org")

;; use ido in org too
(setq org-completion-use-ido t)

;; set <enter> when the cursor is in a link to visit it
(setq org-return-follows-link t)

;; C-c l to save a link to the current file position
(global-set-key (kbd "C-c l") 'org-store-link)

;; Reserve C-' for avy
(define-key org-mode-map (kbd "C-'") nil)

;; auto-fill paragraphs in org buffers
(add-hook 'org-mode-hook 'auto-fill-mode)

;; add new line before a new heading or plain list item, if the other
;; surrounding headings/items also have newlines
(setq org-blank-before-new-entry '((heading . auto)
                                   (plain-list-item . auto)))

;; show only headings when opening an org file for the first time
(setq org-startup-folded 'content)

;; jump to the beginning/end of *content* (ignoring stars, tags, or todo
;; keywords) with the first C-a/C-e, then the true beginning/end of the line
;; with the next.
(setq org-special-ctrl-a/e t)

;; set C-k to kill folded sub-trees when killing a heading, only kill up to the
;; tags when the cursor is in the middle of heading text, and only the tags if
;; the cursor is after the heading text
(setq org-special-ctrl-k t)

;; syntax-highlight source code
(setq org-src-fontify-natively t)

;; highlight inline latex so it stands out
(setq org-highlight-latex-and-related '(latex script entities))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; archiving                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; archive sub-trees in the "/archive" subdir with the same original filename
;; under a datetree
(setq org-archive-location (concat org-directory "/archive/%s::datetree/"))

;; metadata to keep track of when archiving as 'ARCHIVE_' prefixed properties on
;; the subtree. keep track of the category, file, inherited and local tasks,
;; outline path, and archive time
(setq org-archive-save-context-info '(category file itags ltags olpath time))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tags                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-tag-alist '((:startgroup)
                      ("@life" . ?l)
                      ("@side" . ?s)
                      ("@work" . ?w)
                      (:endgroup)
                      ("NOTE" . ?n)))

;; set individual tags without the menu
(setq org-fast-tag-selection-single-key 'expert)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; todo                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; log when todo items are closed
(setq org-log-done 'time)

;; block todo entries from being marked done until all their children are done.
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)

;; [todo -> (started | blocked) -> (done | cancelled)] as the todo state
;; sequence. log when tasks are marked started and done, and log with notes
;; whenever they're marked blocked or canceled.
(setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s!)" "BLOCKED(b@/!)" "|"
                                    "DONE(d)" "CANCELED(c@)")))

;; log state change time stamps in the 'LOGBOOK' drawer.
(setq org-log-into-drawer t)

;; log every time i kick the can down the road
(setq org-log-redeadline 'time)
(setq org-log-reschedule 'time)

;; 3 priorities: A, B, and C
(setq org-highest-priority ?A)
(setq org-default-priority ?B)
(setq org-lowest-priority ?C)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; agenda                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; scan top level files under the org dir, and all files under the `work' subdir
;; for agenda items
(setq org-agenda-files `(,org-directory
                         ,(concat org-directory "/side")
                         ,(concat org-directory "/work")))

;; open agenda in the other window
(setq org-agenda-window-setup 'other-window)

;; sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy '((agenda deadline-up priority-down)
                                    (todo priority-down category-keep)
                                    (tags priority-down category-keep)
                                    (search category-keep)))

;; 'C-c a b' to show a "block" agenda view showing
;; (1) high priority unscheduled tasks,
;; (2) weekly agenda
;; (3) everything else
(setq org-agenda-custom-commands
      '(("b" "Weekly agenda and all unfinished tasks"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-overriding-header
                  "High-priority:")
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo
                                                                      'done))))
          (agenda "")
          (alltodo ""
                   ((org-agenda-overriding-header
                     "Medium/Low-priority:")
                    (org-agenda-skip-function
                     '(or (bl/org-skip-subtree-if-habit)
                          (bl/org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled))))))))))

;; show me ten days worth of stuff, starting three days ago
(setq org-agenda-start-day "-3d")
(setq org-agenda-span 10)
(setq org-agenda-start-on-weekday nil)

;; warn me of upcoming deadlines in the next 3 days.
(setq org-deadline-warning-days 3)

;; skip any deadlines for tasks that are already done
(setq org-agenda-skip-deadline-if-done t)

;; dim blocked todo items
(setq org-agenda-dim-blocked-tasks t)

;; C-c a to bring the agenda up
(global-set-key (kbd "C-c a") 'org-agenda)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; capture                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; save captured tasks in `refile.org'
(setq refile-path (concat org-directory "/refile.org"))
(setq org-default-notes-file refile-path)

;; templates
(setq org-capture-templates

      (let ((today "%(org-insert-time-stamp (org-read-date nil t \"+0d\"))"))
        `(
          ; n: capture notes, recording time and current file
          ("n" "note" entry (file+headline ,refile-path "Notes")
           ,(concat "* %? :NOTE:\n"
                    "%U\n"
                    "%a\n"))

          ; t: capture todo items and record scheduled date.
          ("t" "todo" entry (file+headline ,refile-path "Tasks")
           ,(concat "* TODO [#B] %?\n"
                    "  SCHEDULED: " today "\n")))))

;; C-c c for org capture
(global-set-key (kbd "C-c c") 'org-capture)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; refile                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; include the current file and any agenda file in the refile target list
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))


;; use ido for completion of the whole outline path directly
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

; create parent tasks with refile
(setq org-refile-allow-creating-parent-nodes 'confirm)

; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)
