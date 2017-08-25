;;; zonotope-dark-theme.el
;;
;; Based on tomorrow-night-eighties theme Originally by Chris Kempson
;; https://github.com/ChrisKempson/Tomorrow-Theme


(deftheme zonotope-dark)

(let ((background "#2d2d2d")
      (current-line "#393939")
      (selection "#515151")
      (foreground "#cccccc")
      (comment "#999999")
      (red "#f2777a")
      (orange "#f99157")
      (yellow "#ffcc66")
      (green "#99cc99")
      (cyan "#66cccc")
      (blue "#6699cc")
      (purple "#cc99cc"))

  (custom-theme-set-faces
   'zonotope-dark

   ;; Standard font lock faces
   `(default ((t (:foreground ,foreground :background ,background))))
   `(bold ((t (:weight bold))))
   `(bold-italic ((t (:slant italic :weight bold))))
   `(underline ((t (:underline t))))
   `(italic ((t (:slant italic))))
   `(shadow ((t (:foreground ,comment))))
   `(success ((t (:foreground ,green))))
   `(error ((t (:foreground ,red))))
   `(warning ((t (:foreground ,orange))))
   `(outline-4 ((t (:slant normal :foreground ,comment))))

   ;; Font-lock stuff
   `(font-lock-builtin-face ((t (:foreground ,cyan))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comment :slant italic))))
   `(font-lock-comment-face ((t (:foreground ,comment :slant italic))))
   `(font-lock-constant-face ((t (:foreground ,cyan))))
   `(font-lock-doc-face ((t (:foreground ,comment))))
   `(font-lock-doc-string-face ((t (:foreground ,yellow))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,purple))))
   `(font-lock-negation-char-face ((t (:foreground ,green))))
   `(font-lock-preprocessor-face ((t (:foreground ,purple))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,yellow))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,purple))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,orange))))
   `(font-lock-warning-face ((t (:weight bold :foreground ,red))))

   ;; Emacs interface
   `(cursor ((t (:background ,red))))
   `(fringe ((t (:background ,background))))
   `(linum ((t (:background ,current-line))))
   `(hl-line ((t (:background ,current-line))))
   `(border ((t (:background ,current-line))))
   `(vertical-border ((t (:foreground ,selection))))
   `(border-glyph ((t (nil))))
   `(highlight ((t (:background ,selection))))
   `(link ((t (:foreground ,blue))))
   `(link-visited ((t (:foreground ,purple))))
   `(gui-element ((t (:background ,current-line :foreground ,foreground))))
   `(mode-line ((t (:background ,selection :foreground ,foreground))))
   `(mode-line-inactive ((t (:background ,current-line :foreground ,foreground))))
   `(mode-line-buffer-id ((t (:foreground ,purple :background nil))))
   `(mode-line-emphasis ((t (:foreground ,foreground :slant italic))))
   `(mode-line-highlight ((t (:foreground ,purple :box nil :weight bold))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(region ((t (:background ,selection))))
   `(secondary-,selection ((t (:background ,current-line))))

   `(header-line ((t (:inherit mode-line :foreground ,purple :background nil))))

   `(trailing-whitespace ((t (:background ,red :foreground ,yellow))))
   `(whitespace-empty ((t (:foreground ,red :background ,yellow))))
   `(whitespace-hspace ((t (:background ,selection :foreground ,comment))))
   `(whitespace-indentation ((t (:background ,yellow :foreground ,red))))
   `(whitespace-line ((t (:background ,current-line :foreground ,purple))))
   `(whitespace-newline ((t (:foreground ,comment))))
   `(whitespace-space ((t (:background ,current-line :foreground ,comment))))
   `(whitespace-space-after-tab ((t (:background ,yellow :foreground ,red))))
   `(whitespace-space-before-tab ((t (:background ,orange :foreground ,red))))
   `(whitespace-tab ((t (:background ,selection :foreground ,comment))))
   `(whitespace-trailing ((t (:background ,red :foreground ,yellow))))

   ;; Flymake
   `(flymake-warnline ((t (:underline ,orange :background ,background))))
   `(flymake-errline ((t (:underline ,red :background ,background))))

   ;; Clojure errors
   `(clojure-test-failure-face ((t (:background nil
                                                :inherit flymake-warnline))))
   `(clojure-test-error-face ((t (:background nil :inherit flymake-errline))))
   `(clojure-test-success-face ((t (:background nil :foreground nil
                                               :underline ,green))))

   ;; For Brian Carper's extended clojure syntax table
   `(clojure-keyword ((t (:foreground ,yellow))))
   `(clojure-parens ((t (:foreground ,foreground))))
   `(clojure-braces ((t (:foreground ,green))))
   `(clojure-brackets ((t (:foreground ,yellow))))
   `(clojure-double-quote ((t (:foreground ,cyan :background nil))))
   `(clojure-special ((t (:foreground ,blue))))
   `(clojure-java-call ((class (:foreground ,purple))))

   ;; Rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,cyan))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,orange))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,red))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,comment))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,foreground))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,red))))

   ;; MMM-mode
   `(mmm-code-submode-face ((t (:background ,current-line))))
   `(mmm-comment-submode-face ((t (:inherit font-lock-comment-face))))
   `(mmm-output-submode-face ((t (:background ,current-line))))

   ;; Search
   `(match ((t (:foreground ,blue :background ,background :inverse-video t))))
   `(isearch ((t (:foreground ,yellow :background ,background :inverse-video t))))
   `(isearch-lazy-highlight-face ((t (:foreground ,cyan :background ,background
                                                 :inverse-video t))))
   `(isearch-fail ((t (:background ,background :inherit font-lock-warning-face
                                  :inverse-video t))))

   ;; IDO
   `(ido-subdir ((t (:foreground ,comment))))
   `(ido-first-match ((t (:foreground ,orange :weight bold))))
   `(ido-only-match ((t (:foreground ,red :weight bold))))
   `(ido-indicator ((t (:foreground ,red :background ,background))))
   `(ido-virtual ((t (:foreground ,comment))))

   ;; which-function
   `(which-func ((t (:foreground ,blue :background nil :weight bold))))

   ;; Parenthesis matching (built-in)
   `(show-paren-match ((t (:background ,blue :foreground ,current-line))))
   `(show-paren-mismatch ((t (:background ,orange :foreground ,current-line))))

   ;; Parenthesis matching (mic-paren)
   `(paren-face-match ((t (:foreground nil :background nil
                                      :inherit show-paren-match))))
   `(paren-face-mismatch ((t (:foreground nil :background nil
                                         :inherit show-paren-mismatch))))
   `(paren-face-no-match ((t (:foreground nil :background nil
                                         :inherit show-paren-mismatch))))

   ;; Parenthesis dimming (parenface)
   `(paren-face ((t (:foreground ,comment :background nil))))

   `(sh-heredoc ((t (:foreground nil :inherit font-lock-string-face
                                :weight normal))))
   `(sh-quoted-exec ((t (:foreground nil :inherit font-lock-preprocessor-face))))
   `(slime-highlight-edits-face ((t (:weight bold))))
   `(slime-repl-input-face ((t (:weight normal :underline nil))))
   `(slime-repl-prompt-face ((t (:underline nil :weight bold
                                           :foreground ,purple))))
   `(slime-repl-result-face ((t (:foreground ,green))))
   `(slime-repl-output-face ((t (:foreground ,blue :background ,background))))

   `(csv-separator-face ((t (:foreground ,orange))))

   `(diff-added ((t (:foreground ,green))))
   `(diff-changed ((t (:foreground ,yellow))))
   `(diff-removed ((t (:foreground ,red))))
   `(diff-header ((t (:background ,current-line))))
   `(diff-file-header ((t (:background ,selection))))
   `(diff-hunk-header ((t (:background ,current-line :foreground ,purple))))

   `(ediff-even-diff-A ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-even-diff-B ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-odd-diff-A  ((t (:foreground ,comment :background nil
                                       :inverse-video t))))
   `(ediff-odd-diff-B  ((t (:foreground ,comment :background nil
                                       :inverse-video t))))

   `(eldoc-highlight-function-argument ((t (:foreground ,green :weight bold))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face ((t (:foreground ,foreground))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,green :weight bold))))
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,red))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,yellow))))

   ;; auctex
   `(font-latex-bold-face ((t (:foreground ,green))))
   `(font-latex-doctex-documentation-face ((t (:background ,current-line))))
   `(font-latex-italic-face ((t (:foreground ,green))))
   `(font-latex-math-face ((t (:foreground ,orange))))
   `(font-latex-sectioning-0-face ((t (:foreground ,yellow))))
   `(font-latex-sectioning-1-face ((t (:foreground ,yellow))))
   `(font-latex-sectioning-2-face ((t (:foreground ,yellow))))
   `(font-latex-sectioning-3-face ((t (:foreground ,yellow))))
   `(font-latex-sectioning-4-face ((t (:foreground ,yellow))))
   `(font-latex-sectioning-5-face ((t (:foreground ,yellow))))
   `(font-latex-sedate-face ((t (:foreground ,cyan))))
   `(font-latex-string-face ((t (:foreground ,yellow))))
   `(font-latex-verbatim-face ((t (:foreground ,orange))))
   `(font-latex-warning-face ((t (:foreground ,red))))

   ;; dired+
   `(diredp-compressed-file-suffix ((t (:foreground ,blue))))
   `(diredp-dir-heading ((t (:foreground nil :background nil
                                         :inherit heading))))
   `(diredp-dir-priv ((t (:foreground ,cyan :background nil))))
   `(diredp-exec-priv ((t (:foreground ,blue :background nil))))
   `(diredp-executable-tag ((t (:foreground ,red :background nil))))
   `(diredp-file-name ((t (:foreground ,yellow))))
   `(diredp-file-suffix ((t (:foreground ,green))))
   `(diredp-flag-mark-line ((t (:background nil :inherit highlight))))
   `(diredp-ignored-file-name ((t (:foreground ,comment))))
   `(diredp-link-priv ((t (:background nil :foreground ,purple))))
   `(diredp-mode-line-flagged ((t (:foreground ,red))))
   `(diredp-mode-line-marked ((t (:foreground ,green))))
   `(diredp-no-priv ((t (:background nil))))
   `(diredp-number ((t (:foreground ,yellow))))
   `(diredp-other-priv ((t (:background nil :foreground ,purple))))
   `(diredp-rare-priv ((t (:foreground ,red :background nil))))
   `(diredp-read-priv ((t (:foreground ,green :background nil))))
   `(diredp-symlink ((t (:foreground ,purple))))
   `(diredp-write-priv ((t (:foreground ,yellow :background nil))))

   ;; Magit (a patch is pending in magit to make these standard upstream)
   `(magit-branch ((t (:foreground ,green))))
   `(magit-header ((t (:inherit nil :weight bold))))
   `(magit-item-highlight ((t (:inherit highlight :background nil))))
   `(magit-log-graph ((t (:foreground ,comment))))
   `(magit-log-sha1 ((t (:foreground ,purple))))
   `(magit-log-head-label-bisect-bad ((t (:foreground ,red))))
   `(magit-log-head-label-bisect-good ((t (:foreground ,green))))
   `(magit-log-head-label-default ((t (:foreground ,yellow :box nil
                                                  :weight bold))))
   `(magit-log-head-label-local ((t (:foreground ,blue))))
   `(magit-log-head-label-remote ((t (:foreground ,green))))
   `(magit-log-head-label-tags ((t (:foreground ,cyan :box nil :weight bold))))
   `(magit-section-title ((t (:inherit diff-hunk-header))))

   `(link ((t (:foreground nil :underline t))))
   `(widget-button ((t (:underline t))))
   `(widget-field ((t (:background ,current-line
                                  :box (:line-width 1 :color ,foreground)))))

   ;; Compilation (most faces politely inherit from 'success 'error 'warning
   ;; etc.)
   `(compilation-column-number ((t (:foreground ,yellow))))
   `(compilation-line-number ((t (:foreground ,yellow))))
   `(compilation-message-face ((t (:foreground ,blue))))
   `(compilation-mode-line-exit ((t (:foreground ,green))))
   `(compilation-mode-line-fail ((t (:foreground ,red))))
   `(compilation-mode-line-run ((t (:foreground ,blue))))

   ;; Grep
   `(grep-context-face ((t (:foreground ,comment))))
   `(grep-error-face ((t (:foreground ,red :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,blue))))
   `(grep-match-face ((t (:foreground nil :background nil :inherit match))))

   `(regex-tool-matched-face ((t (:foreground nil :background nil
                                              :inherit match))))

   ;; Ag
   `(ag-match-face ((t (:foreground ,orange :background ,current-line))))

   ;; mark-multiple
   `(mm/master-face ((t (:inherit region :foreground nil :background nil))))
   `(mm/mirror-face ((t (:inherit region :foreground nil :background nil))))

   `(org-agenda-structure ((t (:foreground ,purple))))
   `(org-agenda-date ((t (:foreground ,blue :underline nil))))
   `(org-agenda-done ((t (:foreground ,green))))
   `(org-agenda-dimmed-todo-face ((t (:foreground ,comment))))
   `(org-block ((t (:foreground ,orange))))
   `(org-code ((t (:foreground ,yellow))))
   `(org-column ((t (:background ,current-line))))
   `(org-column-title ((t (:inherit org-column :weight bold :underline t))))
   `(org-date ((t (:foreground ,purple :underline t))))
   `(org-document-info ((t (:foreground ,cyan))))
   `(org-document-info-keyword ((t (:foreground ,green))))
   `(org-document-title ((t (:weight bold :foreground ,orange :height 1.44))))
   `(org-done ((t (:foreground ,green))))
   `(org-ellipsis ((t (:foreground ,comment))))
   `(org-footnote ((t (:foreground ,cyan))))
   `(org-formula ((t (:foreground ,red))))
   `(org-hide ((t (:foreground ,current-line))))
   `(org-link ((t (:foreground ,blue))))
   `(org-scheduled ((t (:foreground ,green))))
   `(org-scheduled-previously ((t (:foreground ,orange))))
   `(org-scheduled-today ((t (:foreground ,green))))
   `(org-special-keyword ((t (:foreground ,orange))))
   `(org-table ((t (:foreground ,purple))))
   `(org-todo ((t (:foreground ,red))))
   `(org-upcoming-deadline ((t (:foreground ,orange))))
   `(org-warning ((t (:weight bold :foreground ,red))))


   `(markdown-url-face ((t (:inherit link))))
   `(markdown-link-face ((t (:foreground ,blue :underline t))))

   `(hl-sexp-face ((t (:background ,current-line))))
   `(highlight-80+ ((t (:background ,current-line))))

   ;; Python-specific overrides
   `(py-builtins-face ((t (:foreground ,orange :weight normal))))

   ;; js2-mode
   `(js2-warning-face ((t (:underline ,orange))))
   `(js2-error-face ((t (:foreground nil :underline ,red))))
   `(js2-external-variable-face ((t (:foreground ,purple))))
   `(js2-function-param-face ((t (:foreground ,blue))))
   `(js2-instance-member-face ((t (:foreground ,blue))))
   `(js2-private-function-call-face ((t (:foreground ,red))))

   ;; js3-mode
   `(js3-warning-face ((t (:underline ,orange))))
   `(js3-error-face ((t (:foreground nil :underline ,red))))
   `(js3-external-variable-face ((t (:foreground ,purple))))
   `(js3-function-param-face ((t (:foreground ,blue))))
   `(js3-jsdoc-tag-face ((t (:foreground ,orange))))
   `(js3-jsdoc-type-face ((t (:foreground ,cyan))))
   `(js3-jsdoc-value-face ((t (:foreground ,yellow))))
   `(js3-jsdoc-html-tag-name-face ((t (:foreground ,blue))))
   `(js3-jsdoc-html-tag-delimiter-face ((t (:foreground ,green))))
   `(js3-instance-member-face ((t (:foreground ,blue))))
   `(js3-private-function-call-face ((t (:foreground ,red))))

   ;; nxml
   `(nxml-name-face ((t (:foreground unspecified
                                    :inherit font-lock-constant-face))))
   `(nxml-attribute-local-name-face
    ((t (:foreground unspecified :inherit font-lock-variable-name-face))))
   `(nxml-ref-face ((t (:foreground unspecified
                                   :inherit font-lock-preprocessor-face))))
   `(nxml-delimiter-face ((t (:foreground unspecified
                                         :inherit font-lock-keyword-face))))
   `(nxml-delimited-data-face ((t (:foreground unspecified
                                              :inherit font-lock-string-face))))
   `(rng-error-face ((t (:underline ,red))))

   ;; RHTML
   `(erb-delim-face ((t (:background ,current-line))))
   `(erb-exec-face ((t (:background ,current-line :weight bold))))
   `(erb-exec-delim-face ((t (:background ,current-line))))
   `(erb-out-face ((t (:background ,current-line :weight bold))))
   `(erb-out-delim-face ((t (:background ,current-line))))
   `(erb-comment-face ((t (:background ,current-line :weight bold
                                      :slant italic))))
   `(erb-comment-delim-face ((t (:background ,current-line))))

   ;; Message-mode
   `(message-header-other ((t (:foreground nil :background nil
                                           :weight normal))))
   `(message-header-subject ((t (:inherit message-header-other :weight bold
                                         :foreground ,yellow))))
   `(message-header-to ((t (:inherit message-header-other :weight bold
                                    :foreground ,orange))))
   `(message-header-cc ((t (:inherit message-header-to :foreground nil))))
   `(message-header-name ((t (:foreground ,blue :background nil))))
   `(message-header-newsgroups ((t (:foreground ,cyan :background nil
                                               :slant normal))))
   `(message-separator ((t (:foreground ,purple))))

   ;; Jabber
   `(jabber-chat-prompt-local ((t (:foreground ,yellow))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,orange))))
   `(jabber-chat-prompt-system ((t (:foreground ,yellow :weight bold))))
   `(jabber-chat-text-local ((t (:foreground ,yellow))))
   `(jabber-chat-text-foreign ((t (:foreground ,orange))))
   `(jabber-chat-text-error ((t (:foreground ,red))))

   `(jabber-roster-user-online ((t (:foreground ,green))))
   `(jabber-roster-user-xa ((t :foreground ,comment)))
   `(jabber-roster-user-dnd ((t :foreground ,yellow)))
   `(jabber-roster-user-away ((t (:foreground ,orange))))
   `(jabber-roster-user-chatty ((t (:foreground ,purple))))
   `(jabber-roster-user-error ((t (:foreground ,red))))
   `(jabber-roster-user-offline ((t (:foreground ,comment))))

   `(jabber-rare-time-face ((t (:foreground ,comment))))
   `(jabber-activity-face ((t (:foreground ,purple))))
   `(jabber-activity-personal-face ((t (:foreground ,cyan))))

   ;; Gnus
   `(gnus-cite-1 ((t (:inherit outline-1 :foreground nil))))
   `(gnus-cite-2 ((t (:inherit outline-2 :foreground nil))))
   `(gnus-cite-3 ((t (:inherit outline-3 :foreground nil))))
   `(gnus-cite-4 ((t (:inherit outline-4 :foreground nil))))
   `(gnus-cite-5 ((t (:inherit outline-5 :foreground nil))))
   `(gnus-cite-6 ((t (:inherit outline-6 :foreground nil))))
   `(gnus-cite-7 ((t (:inherit outline-7 :foreground nil))))
   `(gnus-cite-8 ((t (:inherit outline-8 :foreground nil))))
   ;; there are several more -cite- faces...
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-header-from ((t (:inherit message-header-other-face :weight bold
                                   :foreground ,orange))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-button ((t (:inherit link :foreground nil))))
   `(gnus-signature ((t (:inherit font-lock-comment-face))))

   `(gnus-summary-normal-unread ((t (:foreground ,blue :weight normal))))
   `(gnus-summary-normal-read ((t (:foreground ,foreground :weight normal))))
   `(gnus-summary-normal-ancient ((t (:foreground ,cyan :weight normal))))
   `(gnus-summary-normal-ticked ((t (:foreground ,orange :weight normal))))
   `(gnus-summary-low-unread ((t (:foreground ,comment :weight normal))))
   `(gnus-summary-low-read ((t (:foreground ,comment :weight normal))))
   `(gnus-summary-low-ancient ((t (:foreground ,comment :weight normal))))
   `(gnus-summary-high-unread ((t (:foreground ,yellow :weight normal))))
   `(gnus-summary-high-read ((t (:foreground ,green :weight normal))))
   `(gnus-summary-high-ancient ((t (:foreground ,green :weight normal))))
   `(gnus-summary-high-ticked ((t (:foreground ,orange :weight normal))))
   `(gnus-summary-cancelled ((t (:foreground ,red :background nil
                                            :weight normal))))

   `(gnus-group-mail-low ((t (:foreground ,comment))))
   `(gnus-group-mail-low-empty ((t (:foreground ,comment))))
   `(gnus-group-mail-1 ((t (:foreground nil :weight normal
                                        :inherit outline-1))))
   `(gnus-group-mail-2 ((t (:foreground nil :weight normal
                                        :inherit outline-2))))
   `(gnus-group-mail-3 ((t (:foreground nil :weight normal
                                        :inherit outline-3))))
   `(gnus-group-mail-4 ((t (:foreground nil :weight normal
                                        :inherit outline-4))))
   `(gnus-group-mail-5 ((t (:foreground nil :weight normal
                                        :inherit outline-5))))
   `(gnus-group-mail-6 ((t (:foreground nil :weight normal
                                        :inherit outline-6))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-mail-1
                                          :foreground ,comment))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-mail-2
                                          :foreground ,comment))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-mail-3
                                          :foreground ,comment))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-mail-4
                                          :foreground ,comment))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-mail-5
                                          :foreground ,comment))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-mail-6
                                          :foreground ,comment))))
   `(gnus-group-news-1 ((t (:foreground nil :weight normal
                                        :inherit outline-5))))
   `(gnus-group-news-2 ((t (:foreground nil :weight normal
                                        :inherit outline-6))))
   `(gnus-group-news-3 ((t (:foreground nil :weight normal
                                        :inherit outline-7))))
   `(gnus-group-news-4 ((t (:foreground nil :weight normal
                                        :inherit outline-8))))
   `(gnus-group-news-5 ((t (:foreground nil :weight normal
                                        :inherit outline-1))))
   `(gnus-group-news-6 ((t (:foreground nil :weight normal
                                        :inherit outline-2))))
   `(gnus-group-news-1-empty ((t (:inherit gnus-group-news-1
                                          :foreground ,comment))))
   `(gnus-group-news-2-empty ((t (:inherit gnus-group-news-2
                                          :foreground ,comment))))
   `(gnus-group-news-3-empty ((t (:inherit gnus-group-news-3
                                          :foreground ,comment))))
   `(gnus-group-news-4-empty ((t (:inherit gnus-group-news-4
                                          :foreground ,comment))))
   `(gnus-group-news-5-empty ((t (:inherit gnus-group-news-5
                                          :foreground ,comment))))
   `(gnus-group-news-6-empty ((t (:inherit gnus-group-news-6
                                          :foreground ,comment))))

   `(erc-direct-msg-face ((t (:foreground ,orange))))
   `(erc-error-face ((t (:foreground ,red))))
   `(erc-header-face ((t (:foreground ,foreground :background ,selection))))
   `(erc-input-face ((t (:foreground ,green))))
   `(erc-keyword-face ((t (:foreground ,yellow))))
   `(erc-current-nick-face ((t (:foreground ,green))))
   `(erc-my-nick-face ((t (:foreground ,green))))
   `(erc-nick-default-face ((t (:weight normal :foreground ,purple))))
   `(erc-nick-msg-face ((t (:weight normal :foreground ,yellow))))
   `(erc-notice-face ((t (:foreground ,comment))))
   `(erc-pal-face ((t (:foreground ,orange))))
   `(erc-prompt-face ((t (:foreground ,blue))))
   `(erc-timestamp-face ((t (:foreground ,cyan))))

   `(custom-variable-tag ((t (:foreground ,blue))))
   `(custom-group-tag ((t (:foreground ,blue))))
   `(custom-state ((t (:foreground ,green)))))

  (custom-theme-set-variables
   'zonotope-dark
   `(ansi-color-names-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [,background ,red ,green ,yellow ,blue ,purple ,cyan ,foreground])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,background ,red ,green ,yellow ,blue ,purple ,cyan
                  ,foreground])
   `(org-priority-faces
     '((?A . (:foreground ,yellow :weight bold))
       (?B . (:foreground ,green))
       (?C . (:foreground ,blue))))))

(provide-theme 'zonotope-dark)
