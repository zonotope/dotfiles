;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; interface                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-directory "~/docs/org")

;; use ido in org too
(setq org-completion-use-ido t)

;; 3 priorities: A, B, and C
(setq org-highest-priority ?A)
(setq org-default-priority ?B)
(setq org-lowest-priority ?C)

;; log when todo items are closed
(setq org-log-done t)

;;warn me of any deadlines in next 3 days
(setq org-deadline-warning-days 3)

;; C-c l to save a link to the current file position
(global-set-key (kbd "C-c l") 'org-store-link)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tags                                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-tag-alist '(("NOTE" . ?n)))

;; set individual tags without the menu
(setq org-fast-tag-selection-single-key 'expert)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; agenda                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; scan top level files under the org dir, and all files under the `work' subdir
;; for agenda items
(setq org-agenda-files `(,org-directory
                         ,(concat org-directory "/work")))

;; open agenda in current window
(setq org-agenda-window-setup 'current-window)

;; show me tasks scheduled or due in next two weeks
(setq org-agenda-span 'fortnight)

;; sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
      '((agenda deadline-up priority-down)
        (todo priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep)))

;; C-c a to bring the agenda up
(global-set-key (kbd "C-c a") 'org-agenda)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; capture                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-c c for org capture
(global-set-key (kbd "C-c c") 'org-capture)

;; save captured tasks in `refile.org'
(setq refile-path (concat org-directory "/refile.org"))
(setq org-default-notes-file refile-path)

;; templates
(setq org-capture-templates

      (let ((today "%(org-insert-time-stamp (org-read-date nil t \"+0d\"))"))
        `(
          ; n: capture notes, recording time and current file
          ("n" "note" entry (file+headline ,refile-path "Notes")
           ,(concat "\n"
                    "* %? :NOTE:\n"
                    "%U\n"
                    "%a\n"))

          ; t: capture todo items and record scheduled date.
          ("t" "todo" entry (file+headline ,refile-path "Tasks")
           ,(concat "\n"
                    "* TODO [#B] %?\n"
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


(provide 'org-config)
