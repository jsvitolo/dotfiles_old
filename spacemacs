;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()

  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()

   dotspacemacs-configuration-layers
   '(
     markdown
     python
     react
     typescript
     syntax-checking
     csv
     html
     ruby
     yaml
     ruby-on-rails
     elixir
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     osx
     git
      (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     )

   dotspacemacs-additional-packages '(all-the-icons)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(evil-unimpaired)
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Fira Code"
                               :size 15
                               :weight normal
                               :width normal
                               :antialias 1
                               :powerline-scale 1.2)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  (setq exec-path-from-shell-arguments '("-l"))
  (setq explicit-shell-file-name "/usr/local/bin/zsh")
  (setq shell-file-name "zsh")
  (display-time-mode 1)
  )

(defun dotspacemacs/user-config ()
  (autoload 'neotree "neotree" "" t)
  (setq neo-window-width 50)
  (setq neo-persist-show nil)
  (setq-default mac-right-option-modifier nil)

  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)

  ;; Search the word at point with Dash
  (add-to-list 'load-path "~/.dotfiles/spacemacs-dir/dash-at-point/")
  (autoload 'dash-at-point "dash-at-point"
    "Search the word at point with Dash." t nil)
  (global-set-key "\C-cd" 'dash-at-point)
  (global-set-key "\C-ce" 'dash-at-point-with-docset)

  (add-to-list 'auto-mode-alist '("\\.etl$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . typescript-mode))

  (setq powerline-default-separator 'arrow-fade)

  (global-vi-tilde-fringe-mode -1)

  ;; Testing company mode
  (global-company-mode)
  (require 'elixir-mode)
  (require 'alchemist)
  (setq flycheck-elixir-credo-strict t)

  (add-hook 'after-init-hook 'global-company-mode)

  (global-evil-mc-mode 1)

  (define-key evil-normal-state-map (kbd "M-s") 'evil-mc-make-and-goto-next-match)
  (define-key evil-insert-state-map (kbd "M-d") 'evil-mc-undo-all-cursors)
  (define-key evil-normal-state-map (kbd "M-a") 'evil-mc-skip-and-goto-next-match)

  ;; FiraCode and other glyphy fonts
  (mac-auto-operator-composition-mode)

  (defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  (setq typescript-mode-indent-offset n) ; typescript-mode
  (setq python-mode-indent-offset n) ; python-mode
  )

  (my-setup-indent 2) ; indent 2 spaces width

  (define-coding-system-alias 'utf8 'utf-8)
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)

  ;; set font
  (custom-set-faces
   )(defun fontify-frame (frame)
      (set-frame-parameter frame 'font "Fira Code-15"))
    ;; Fontify current frame
    (fontify-frame nil)
    ;; Fontify any future frames
    (push 'fontify-frame after-make-frame-functions)

  ;; (set-face-attribute 'default nil :family "Source Code Pro")
  ;; (set-face-attribute 'default nil :height 175)

  ;; (set-face-attribute 'default nil :font "Fira Code-12")
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(neo-auto-indent-point t t)
 '(neo-banner-message "Press ? for neotree help" t)
 '(neo-create-file-auto-open t t)
 '(neo-show-hidden-files t t)
 '(neo-show-updir-line nil t)
 '(neo-smart-open t t)
 '(neo-theme (quote icons))
 '(neo-window-fixed-size t)
 '(neo-window-position (quote right))
 '(neo-window-width 57 t)
 '(package-selected-packages
   (quote
    (ghub let-alist auto-complete mmm-mode markdown-toc markdown-mode gh-md ac-alchemist web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic dash-at-point evil-multiedit tide typescript-mode evil-unimpaired csv-mode memoize font-lock+ spaceline-all-the-icons all-the-icons zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme unfill powerline smeargle reveal-in-osx-finder pbcopy spinner osx-trash osx-dictionary orgit mwim magit-gitflow launchctl hydra parent-mode projectile helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flx evil-magit magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree highlight f diminish diff-hl company-web web-completion-data company-statistics bind-map bind-key auto-yasnippet yasnippet auto-dictionary packed s dash pkg-info epl helm avy helm-core async ac-ispell popup xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ob-elixir flycheck-mix flycheck-credo flycheck alchemist company elixir-mode projectile-rails inflections feature-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby yaml-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
