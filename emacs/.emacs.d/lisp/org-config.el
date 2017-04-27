;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; interface                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set priority range from A to C with default B
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?B)

;; log when todo items are closed
(setq org-log-done t)

;;warn me of any deadlines in next 3 days
(setq org-deadline-warning-days 3)

;; C-c l to save a link to the current file position
(global-set-key (kbd "C-c l") 'org-store-link)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; agenda                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; agenda todo file
(setq agenda-path "~/docs/org/agenda.org")
(setq org-agenda-files `(,agenda-path))

;; C-c a to bring the agenda up
(global-set-key (kbd "C-c a") 'org-agenda)

;; open agenda in current window
(setq org-agenda-window-setup 'current-window)

;;show me tasks scheduled or due in next two weeks
(setq org-agenda-span 'fortnight)

;;sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
      '((agenda deadline-up priority-down)
        (todo priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; capture                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-c c for org capture
(global-set-key (kbd "C-c c") 'org-capture)

;; templates
(setq org-capture-templates

      ;; capture todo items and record scheduled time with C-c c t.
      `(("t" "todo" entry (file+headline ,agenda-path "Tasks")
         ,(concat "* TODO [#B] %?\n"
                  "SCHEDULED: "
                  "%(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n"))))


(provide 'org-config)
