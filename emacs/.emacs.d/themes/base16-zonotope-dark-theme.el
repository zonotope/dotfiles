;; Base16 zonotope (https://github.com/chriskempson/base16)
;; Scheme: Ben Lamothe

;;; base16-zonotope-dark-theme.el

;;; Code:

(deftheme base16-zonotope-dark)

(let ((black "#2d2d2d")  ;; background
      (base01 "#393939") ;; current line

      (base02 "#515151") ;; highlight
      (base03 "#747474") ;; comment
      (base04 "#a0a0a0") ;;
      (white "#cccccc")  ;; foreground

      (base06 "#e8e6df") ;; light accent
      (base07 "#f2f0ec") ;; light background

      (red "#f2777a")    ;; red
      (orange "#f99157") ;; orange
      (yellow "#ffcc66") ;; yellow
      (green "#99cc99")  ;; green
      (cyan "#66cccc")   ;; cyan
      (blue "#6699cc")   ;; blue
      (purple "#cc99cc") ;; purple
      (brown "#d27b53")  ;; brown
      )

  (custom-theme-set-faces
   'base16-zonotope-dark

   ;; Built-in stuff (Emacs 23)
   `(border ((t (:background ,base03))))
   `(border-glyph ((t (nil))))
   `(cursor ((t (:background ,red))))
   `(default ((t (:background ,black :foreground ,white))))
   `(fringe ((t (:background ,base01))))
   `(gui-element ((t (:background ,base03 :foreground ,base06))))
   `(highlight ((t (:background ,base01))))
   `(link ((t (:foreground ,blue))))
   `(link-visited ((t (:foreground ,purple))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(mode-line ((t (:background ,base02 :foreground ,base04 :box nil))))
   `(mode-line-inactive ((t (:background ,base01 :foreground ,base03 :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,purple :background nil))))
   `(mode-line-emphasis ((t (:foreground ,base06 :slant italic))))
   `(mode-line-highlight ((t (:foreground ,purple :box nil :weight bold))))
   `(region ((t (:background ,base02))))
   `(secondary-selection ((t (:background ,base03))))
   `(error ((t (:foreground ,red :weight bold))))
   `(warning ((t (:foreground ,orange :weight bold))))
   `(success ((t (:foreground ,green :weight bold))))

   `(header-line ((t (:inherit mode-line :foreground ,purple :background nil))))

   ;; Font-lock stuff
   `(font-lock-builtin-face ((t (:foreground ,cyan))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,base03))))
   `(font-lock-comment-face ((t (:foreground ,base03))))
   `(font-lock-constant-face ((t (:foreground ,orange))))
   `(font-lock-doc-face ((t (:foreground ,base04))))
   `(font-lock-doc-string-face ((t (:foreground ,base03))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,purple))))
   `(font-lock-negation-char-face ((t (:foreground ,green))))
   `(font-lock-preprocessor-face ((t (:foreground ,blue))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,yellow))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,purple))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,cyan))))
   `(font-lock-warning-face ((t (:foreground ,red))))

   ;; linum-mode
   `(linum ((t (:background ,base01 :foreground ,base03))))

   ;; Search
   `(match ((t (:foreground ,blue :background ,base01 :inverse-video t))))
   `(isearch ((t (:foreground ,yellow :background ,base01 :inverse-video t))))
   `(isearch-lazy-highlight-face ((t (:foreground ,cyan :background ,base01 :inverse-video t))))
   `(isearch-fail ((t (:background ,base01 :inherit font-lock-warning-face :inverse-video t))))

   ;;; magit

   ;; headings and diffs
   `(magit-section-highlight           ((t (:background ,base02))))
   `(magit-section-heading             ((t (:foreground ,yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,orange :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,base02 :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,base02
                                                        :foreground ,orange :weight bold))))
   `(magit-diff-hunk-heading
     ((t (:background ,base04))))
   `(magit-diff-hunk-heading-highlight
     ((t (:background ,base04))))
   `(magit-diff-hunk-heading-selection
     ((t (:background ,base04
                      :foreground ,orange
                      :weight bold))))
   `(magit-diff-lines-heading          ((t (:background ,orange
                                                        :foreground ,black))))
   `(magit-diff-context-highlight      ((t (:background ,base01))))
   `(magit-diffstat-added              ((t (:foreground ,green))))
   `(magit-diffstat-removed            ((t (:foreground ,red))))

   ;; popup
   `(magit-popup-heading             ((t (:foreground ,white :weight normal))))
   `(magit-popup-key                 ((t (:foreground ,white :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,white :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,base01 :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,white :weight bold))))

   ;; process
   `(magit-process-ok    ((t (:foreground ,green :weight bold))))
   `(magit-process-ng    ((t (:foreground ,red   :weight bold))))

   ;; log
   `(magit-log-author    ((t (:foreground ,base02 :weight bold))))
   `(magit-log-date      ((t (:foreground ,base02))))
   `(magit-log-graph     ((t (:foreground ,white))))

   ;; sequence
   `(magit-sequence-pick ((t (:foreground ,orange))))
   `(magit-sequence-stop ((t (:foreground ,green))))
   `(magit-sequence-part ((t (:foreground ,yellow))))
   `(magit-sequence-head ((t (:foreground ,blue))))
   `(magit-sequence-drop ((t (:foreground ,red))))
   `(magit-sequence-done ((t (:foreground ,base02))))
   `(magit-sequence-onto ((t (:foreground ,base02))))

   ;; bisect
   `(magit-bisect-good ((t (:foreground ,green))))
   `(magit-bisect-skip ((t (:foreground ,yellow))))
   `(magit-bisect-bad  ((t (:foreground ,red))))

   ;; blame
   `(magit-blame-heading ((t (:background ,base01 :foreground ,purple
                                          :weight bold :slant normal :box (:color ,base02 :line-width 2)))))
   `(magit-blame-hash    ((t (:background ,base01 :foreground ,purple
                                          :weight normal :slant normal :box (:color ,base02 :line-width 2)))))
   `(magit-blame-name    ((t (:background ,base01 :foreground ,purple
                                          :weight normal :slant normal :box (:color ,base02 :line-width 2)))))
   `(magit-blame-date    ((t (:background ,base01 :foreground ,purple
                                          :weight bold :slant normal :box (:color ,base02 :line-width 2)))))
   `(magit-blame-summary ((t (:background ,base01 :foreground ,base04
                                          :weight bold :slant normal :box (:color ,base02 :line-width 2)))))

   ;; references etc.
   `(magit-dimmed         ((t (:foreground ,base02))))
   `(magit-hash           ((t (:foreground ,base02))))
   `(magit-tag            ((t (:foreground ,cyan :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,green  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,blue   :weight bold))))
   `(magit-branch-current ((t (:foreground ,blue   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,blue   :weight bold))))
   `(magit-refname        ((t (:background ,base01 :foreground ,base02 :weight bold))))
   `(magit-refname-stash  ((t (:background ,base01 :foreground ,base02 :weight bold))))
   `(magit-refname-wip    ((t (:background ,base01 :foreground ,base02 :weight bold))))
   `(magit-signature-good      ((t (:foreground ,green))))
   `(magit-signature-bad       ((t (:foreground ,red))))
   `(magit-signature-untrusted ((t (:foreground ,yellow))))
   `(magit-cherry-unmatched    ((t (:foreground ,cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,purple))))
   `(magit-reflog-commit       ((t (:foreground ,green))))
   `(magit-reflog-amend        ((t (:foreground ,purple))))
   `(magit-reflog-merge        ((t (:foreground ,green))))
   `(magit-reflog-checkout     ((t (:foreground ,blue))))
   `(magit-reflog-reset        ((t (:foreground ,red))))
   `(magit-reflog-rebase       ((t (:foreground ,purple))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,green))))
   `(magit-reflog-remote       ((t (:foreground ,cyan))))
   `(magit-reflog-other        ((t (:foreground ,cyan))))

   ;; Popups
   `(popup-face ((t (:foreground ,white :background ,base02))))
   `(popup-isearch-match ((t (:foreground ,black :background ,green))))
   `(popup-scroll-bar-background-face ((t (:background ,base03))))
   `(popup-scroll-bar-foreground-face ((t (:background ,white))))
   `(popup-summary-face ((t (:foreground ,base04))))
   `(popup-tip-face ((t (:foreground ,black :background ,yellow))))
   `(popup-menu-mouse-face ((t (:foreground ,black :background ,blue))))
   `(popup-menu-selection-face ((t (:foreground ,black :background ,cyan))))

   ;; Flymake
   `(flymake-warnline ((t (:underline ,orange :background ,base01))))
   `(flymake-errline ((t (:underline ,red :background ,base01))))

   ;; Clojure errors
   `(clojure-test-failure-face ((t (:background nil :inherit flymake-warnline))))
   `(clojure-test-error-face ((t (:background nil :inherit flymake-errline))))
   `(clojure-test-success-face ((t (:background nil :foreground nil :underline ,green))))

   ;; For Brian Carper's extended clojure syntax table
   `(clojure-keyword ((t (:foreground ,yellow))))
   `(clojure-parens ((t (:foreground ,base06))))
   `(clojure-braces ((t (:foreground ,green))))
   `(clojure-brackets ((t (:foreground ,yellow))))
   `(clojure-double-quote ((t (:foreground ,cyan :background nil))))
   `(clojure-special ((t (:foreground ,blue))))
   `(clojure-java-call ((t (:foreground ,purple))))

   ;; MMM-mode
   `(mmm-code-submode-face ((t (:background ,base03))))
   `(mmm-comment-submode-face ((t (:inherit font-lock-comment-face))))
   `(mmm-output-submode-face ((t (:background ,base03))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,cyan))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,orange))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,red))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,base03))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,white))))

   ;; IDO
   `(ido-subdir ((t (:foreground ,base04))))
   `(ido-first-match ((t (:foreground ,orange :weight bold))))
   `(ido-only-match ((t (:foreground ,red :weight bold))))
   `(ido-indicator ((t (:foreground ,red :background ,base01))))
   `(ido-virtual ((t (:foreground ,base04))))

   ;; which-function
   `(which-func ((t (:foreground ,blue :background nil :weight bold))))

   `(trailing-whitespace ((t (:background ,cyan :foreground ,yellow))))
   `(whitespace-empty ((t (:foreground ,red :background ,yellow))))
   `(whitespace-hspace ((t (:background ,base04 :foreground ,base04))))
   `(whitespace-indentation ((t (:background ,yellow :foreground ,red))))
   `(whitespace-line ((t (:background ,base01 :foreground ,brown))))
   `(whitespace-newline ((t (:foreground ,base04))))
   `(whitespace-space ((t (:background ,base01 :foreground ,base04))))
   `(whitespace-space-after-tab ((t (:background ,yellow :foreground ,red))))
   `(whitespace-space-before-tab ((t (:background ,orange :foreground ,red))))
   `(whitespace-tab ((t (:background ,base04 :foreground ,base04))))
   `(whitespace-trailing ((t (:background ,red :foreground ,yellow))))

   ;; Parenthesis matching (built-in)
   `(show-paren-match ((t (:background ,blue :foreground ,base03))))
   `(show-paren-mismatch ((t (:background ,orange :foreground ,base03))))

   ;; Parenthesis matching (mic-paren)
   `(paren-face-match ((t (:foreground nil :background nil :inherit show-paren-match))))
   `(paren-face-mismatch ((t (:foreground nil :background nil :inherit show-paren-mismatch))))
   `(paren-face-no-match ((t (:foreground nil :background nil :inherit show-paren-mismatch))))

   ;; Parenthesis dimming (parenface)
   `(paren-face ((t (:foreground ,base04 :background nil))))

   `(sh-heredoc ((t (:foreground nil :inherit font-lock-string-face :weight normal))))
   `(sh-quoted-exec ((t (:foreground nil :inherit font-lock-preprocessor-face))))
   `(slime-highlight-edits-face ((t (:weight bold))))
   `(slime-repl-input-face ((t (:weight normal :underline nil))))
   `(slime-repl-prompt-face ((t (:underline nil :weight bold :foreground ,purple))))
   `(slime-repl-result-face ((t (:foreground ,green))))
   `(slime-repl-output-face ((t (:foreground ,blue :background ,base01))))

   `(csv-separator-face ((t (:foreground ,orange))))

   `(diff-added ((t (:foreground ,green))))
   `(diff-changed ((t (:foreground ,yellow))))
   `(diff-removed ((t (:foreground ,red))))
   `(diff-header ((t (:background ,base01))))
   `(diff-file-header ((t (:background ,base02))))
   `(diff-hunk-header ((t (:background ,base01 :foreground ,purple))))

   `(ediff-even-diff-A ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-even-diff-B ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-odd-diff-A  ((t (:foreground ,base04 :background nil :inverse-video t))))
   `(ediff-odd-diff-B  ((t (:foreground ,base04 :background nil :inverse-video t))))

   `(eldoc-highlight-function-argument ((t (:foreground ,green :weight bold))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face ((t (:foreground ,base06))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,green :weight bold))))
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,red))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,yellow))))

   ;; auctex
   `(font-latex-bold-face ((t (:foreground ,green))))
   `(font-latex-doctex-documentation-face ((t (:background ,base03))))
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
   `(diredp-dir-heading ((t (:foreground nil :background nil :inherit heading))))
   `(diredp-dir-priv ((t (:foreground ,cyan :background nil))))
   `(diredp-exec-priv ((t (:foreground ,blue :background nil))))
   `(diredp-executable-tag ((t (:foreground ,red :background nil))))
   `(diredp-file-name ((t (:foreground ,yellow))))
   `(diredp-file-suffix ((t (:foreground ,green))))
   `(diredp-flag-mark-line ((t (:background nil :inherit highlight))))
   `(diredp-ignored-file-name ((t (:foreground ,base04))))
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

   ;; term and ansi-term
   `(term-color-black ((t (:foreground ,base02 :background ,black))))
   `(term-color-white ((t (:foreground ,white :background ,base07))))
   `(term-color-red ((t (:foreground ,red :background ,red))))
   `(term-color-yellow ((t (:foreground ,yellow :background ,yellow))))
   `(term-color-green ((t (:foreground ,green :background ,green))))
   `(term-color-cyan ((t (:foreground ,cyan :background ,cyan))))
   `(term-color-blue ((t (:foreground ,blue :background ,blue))))
   `(term-color-magenta ((t (:foreground ,purple :background ,purple))))

   `(link ((t (:foreground nil :underline t))))
   `(widget-button ((t (:underline t))))
   `(widget-field ((t (:background ,base03 :box (:line-width 1 :color ,base06)))))

   ;; Compilation (most faces politely inherit from 'success, 'error, 'warning etc.)
   `(compilation-column-number ((t (:foreground ,yellow))))
   `(compilation-line-number ((t (:foreground ,yellow))))
   `(compilation-message-face ((t (:foreground ,blue))))
   `(compilation-mode-line-exit ((t (:foreground ,green))))
   `(compilation-mode-line-fail ((t (:foreground ,red))))
   `(compilation-mode-line-run ((t (:foreground ,blue))))

   ;; Grep
   `(grep-context-face ((t (:foreground ,base04))))
   `(grep-error-face ((t (:foreground ,red :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,blue))))
   `(grep-match-face ((t (:foreground nil :background nil :inherit match))))

   `(regex-tool-matched-face ((t (:foreground nil :background nil :inherit match))))

   ;; Cscope
   `(cscope-file-face ((t (:foreground ,green))))
   `(cscope-function-face ((t (:foreground ,blue))))
   `(cscope-line-number-face ((t (:foreground ,yellow))))
   `(cscope-mouse-face ((t (:background ,base01 :foreground ,base04))))
   `(cscope-separator-face ((t (:foreground ,red :overline t :underline t :weight bold))))

   ;; mark-multiple
   `(mm/master-face ((t (:inherit region :foreground nil :background nil))))
   `(mm/mirror-face ((t (:inherit region :foreground nil :background nil))))

   ;; org-mode
   `(org-agenda-structure ((t (:foreground ,purple))))
   `(org-agenda-date ((t (:foreground ,blue :underline nil))))
   `(org-agenda-done ((t (:foreground ,green))))
   `(org-agenda-dimmed-todo-face ((t (:foreground ,base04))))
   `(org-block ((t (:foreground ,orange))))
   `(org-code ((t (:foreground ,yellow))))
   `(org-column ((t (:background ,base01))))
   `(org-column-title ((t (:inherit org-column :weight bold :underline t))))
   `(org-date ((t (:foreground ,purple :underline t))))
   `(org-document-info ((t (:foreground ,cyan))))
   `(org-document-info-keyword ((t (:foreground ,green))))
   `(org-document-title ((t (:weight bold :foreground ,orange :height 1.44))))
   `(org-done ((t (:foreground ,green))))
   `(org-ellipsis ((t (:foreground ,base04))))
   `(org-footnote ((t (:foreground ,cyan))))
   `(org-formula ((t (:foreground ,red))))
   `(org-hide ((t (:foreground ,base03))))
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

   `(hl-sexp-face ((t (:background ,base03))))
   `(highlight-80+ ((t (:background ,base03))))

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
   `(nxml-name-face ((t (:foreground unspecified :inherit font-lock-constant-face))))
   `(nxml-attribute-local-name-face ((t (:foreground unspecified :inherit font-lock-variable-name-face))))
   `(nxml-ref-face ((t (:foreground unspecified :inherit font-lock-preprocessor-face))))
   `(nxml-delimiter-face ((t (:foreground unspecified :inherit font-lock-keyword-face))))
   `(nxml-delimited-data-face ((t (:foreground unspecified :inherit font-lock-string-face))))
   `(rng-error-face ((t (:underline ,red))))

   ;; RHTML
   `(erb-delim-face ((t (:background ,base03))))
   `(erb-exec-face ((t (:background ,base03 :weight bold))))
   `(erb-exec-delim-face ((t (:background ,base03))))
   `(erb-out-face ((t (:background ,base03 :weight bold))))
   `(erb-out-delim-face ((t (:background ,base03))))
   `(erb-comment-face ((t (:background ,base03 :weight bold :slant italic))))
   `(erb-comment-delim-face ((t (:background ,base03))))

   ;; Message-mode
   `(message-header-other ((t (:foreground nil :background nil :weight normal))))
   `(message-header-subject ((t (:inherit message-header-other :weight bold :foreground ,yellow))))
   `(message-header-to ((t (:inherit message-header-other :weight bold :foreground ,orange))))
   `(message-header-cc ((t (:inherit message-header-to :foreground nil))))
   `(message-header-name ((t (:foreground ,blue :background nil))))
   `(message-header-newsgroups ((t (:foreground ,cyan :background nil :slant normal))))
   `(message-separator ((t (:foreground ,purple))))

   ;; Jabber
   `(jabber-chat-prompt-local ((t (:foreground ,yellow))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,orange))))
   `(jabber-chat-prompt-system ((t (:foreground ,yellow :weight bold))))
   `(jabber-chat-text-local ((t (:foreground ,yellow))))
   `(jabber-chat-text-foreign ((t (:foreground ,orange))))
   `(jabber-chat-text-error ((t (:foreground ,red))))

   `(jabber-roster-user-online ((t (:foreground ,green))))
   `(jabber-roster-user-xa ((t :foreground ,base04)))
   `(jabber-roster-user-dnd ((t :foreground ,yellow)))
   `(jabber-roster-user-away ((t (:foreground ,orange))))
   `(jabber-roster-user-chatty ((t (:foreground ,purple))))
   `(jabber-roster-user-error ((t (:foreground ,red))))
   `(jabber-roster-user-offline ((t (:foreground ,base04))))

   `(jabber-rare-time-face ((t (:foreground ,base04))))
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
   `(gnus-header-from ((t (:inherit message-header-other-face :weight bold :foreground ,orange))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-button ((t (:inherit link :foreground nil))))
   `(gnus-signature ((t (:inherit font-lock-comment-face))))

   `(gnus-summary-normal-unread ((t (:foreground ,blue :weight normal))))
   `(gnus-summary-normal-read ((t (:foreground ,base06 :weight normal))))
   `(gnus-summary-normal-ancient ((t (:foreground ,cyan :weight normal))))
   `(gnus-summary-normal-ticked ((t (:foreground ,orange :weight normal))))
   `(gnus-summary-low-unread ((t (:foreground ,base04 :weight normal))))
   `(gnus-summary-low-read ((t (:foreground ,base04 :weight normal))))
   `(gnus-summary-low-ancient ((t (:foreground ,base04 :weight normal))))
   `(gnus-summary-high-unread ((t (:foreground ,yellow :weight normal))))
   `(gnus-summary-high-read ((t (:foreground ,green :weight normal))))
   `(gnus-summary-high-ancient ((t (:foreground ,green :weight normal))))
   `(gnus-summary-high-ticked ((t (:foreground ,orange :weight normal))))
   `(gnus-summary-cancelled ((t (:foreground ,red :background nil :weight normal))))

   `(gnus-group-mail-low ((t (:foreground ,base04))))
   `(gnus-group-mail-low-empty ((t (:foreground ,base04))))
   `(gnus-group-mail-1 ((t (:foreground nil :weight normal :inherit outline-1))))
   `(gnus-group-mail-2 ((t (:foreground nil :weight normal :inherit outline-2))))
   `(gnus-group-mail-3 ((t (:foreground nil :weight normal :inherit outline-3))))
   `(gnus-group-mail-4 ((t (:foreground nil :weight normal :inherit outline-4))))
   `(gnus-group-mail-5 ((t (:foreground nil :weight normal :inherit outline-5))))
   `(gnus-group-mail-6 ((t (:foreground nil :weight normal :inherit outline-6))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-mail-1 :foreground ,base04))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-mail-2 :foreground ,base04))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-mail-3 :foreground ,base04))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-mail-4 :foreground ,base04))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-mail-5 :foreground ,base04))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-mail-6 :foreground ,base04))))
   `(gnus-group-news-1 ((t (:foreground nil :weight normal :inherit outline-5))))
   `(gnus-group-news-2 ((t (:foreground nil :weight normal :inherit outline-6))))
   `(gnus-group-news-3 ((t (:foreground nil :weight normal :inherit outline-7))))
   `(gnus-group-news-4 ((t (:foreground nil :weight normal :inherit outline-8))))
   `(gnus-group-news-5 ((t (:foreground nil :weight normal :inherit outline-1))))
   `(gnus-group-news-6 ((t (:foreground nil :weight normal :inherit outline-2))))
   `(gnus-group-news-1-empty ((t (:inherit gnus-group-news-1 :foreground ,base04))))
   `(gnus-group-news-2-empty ((t (:inherit gnus-group-news-2 :foreground ,base04))))
   `(gnus-group-news-3-empty ((t (:inherit gnus-group-news-3 :foreground ,base04))))
   `(gnus-group-news-4-empty ((t (:inherit gnus-group-news-4 :foreground ,base04))))
   `(gnus-group-news-5-empty ((t (:inherit gnus-group-news-5 :foreground ,base04))))
   `(gnus-group-news-6-empty ((t (:inherit gnus-group-news-6 :foreground ,base04))))

   `(erc-direct-msg-face ((t (:foreground ,orange))))
   `(erc-error-face ((t (:foreground ,red))))
   `(erc-header-face ((t (:foreground ,base06 :background ,base04))))
   `(erc-input-face ((t (:foreground ,green))))
   `(erc-keyword-face ((t (:foreground ,yellow))))
   `(erc-current-nick-face ((t (:foreground ,green))))
   `(erc-my-nick-face ((t (:foreground ,green))))
   `(erc-nick-default-face ((t (:weight normal :foreground ,purple))))
   `(erc-nick-msg-face ((t (:weight normal :foreground ,yellow))))
   `(erc-notice-face ((t (:foreground ,base04))))
   `(erc-pal-face ((t (:foreground ,orange))))
   `(erc-prompt-face ((t (:foreground ,blue))))
   `(erc-timestamp-face ((t (:foreground ,cyan))))

   `(custom-variable-tag ((t (:foreground ,blue))))
   `(custom-group-tag ((t (:foreground ,blue))))
   `(custom-state ((t (:foreground ,green)))))


  (custom-theme-set-variables
   'base16-zonotope-dark

   `(ansi-color-names-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [,black ,red ,green ,yellow ,blue ,purple ,cyan ,white])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,black ,red ,green ,yellow ,blue ,purple ,cyan ,white])))

(provide-theme 'base16-zonotope-dark)

(provide 'zonotope)



;;; base16-zonotope-dark-theme.el ends here
