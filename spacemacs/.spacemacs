;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values.
"
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     common-lisp
     eyebrowse
     typescript
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ac-slime howm dired-toggle dired+ graphviz-dot-mode tide
                                               ace-jump-mode calfw calfw-ical japanese-holidays calfw-howm
                                               ox-reveal dired-ranger calfw-org hiwin)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(company)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update nil
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         tsdh-dark
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-fle-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (load-theme 'tsdh-dark t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq inferior-lisp-program "/usr/local/bin/clisp")

  (add-hook 'typescript-mode-hook
            (lambda ()
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (define-key tide-mode-map (kbd "g D") 'tide-jump-to-definition)
              ))
  (global-auto-complete-mode t)
  (define-key ac-completing-map (kbd "C-n") 'ac-next)      ; C-nで次候補選択
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)  ; C-pで前候補選択

  (setq-default ac-sources '(
                             ac-source-words-in-all-buffer
                             ac-source-words-in-buffer
                             ac-source-filename
                             ))
  (setq-default ac-auto-start 3)                ;補完開始文字数
  (setq-default ac-delay 0.05)                  ;補完処理開始
  (setq-default ac-auto-show-menu 0.2)          ;補完候補表示
  (setq-default ac-quick-help-delay 0.5)        ;クィックヘルプ表示
  (add-to-list 'ac-modes 'typescript-mode)
  (define-key ac-mode-map (kbd "C-u TAB") 'auto-complete)
  ;(require 'tss)
  ;(tss-config-default)

  (require 'ac-slime)
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

  (define-key global-map (kbd "<C-tab>") 'other-window)

  (global-linum-mode t)
  (global-set-key "\C-c\C-r" 'my-window-resizer)

  ;;折り返さない
  (setq-default truncate-partial-width-windows t)
  (setq-default truncate-lines t)

  ;;めもです
  (define-key global-map (kbd "C-c t d") (lambda ()(interactive)(find-file "~/todo.org")))
  (define-key global-map (kbd "C-c m") (lambda ()(interactive)(find-file "~/.emacs.d/mymemo.org")))

  ;;org関連
  (require 'org)
  (setq org-fast-todo-selection t)
  ;(setq org-todo-keywords
  ;      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "Done(x)" "CANCEL(c)")))
  (setq org-todo-keywords
        '((sequence "TODO" "STARTED" "WAITING" "|" "Done" "CANCEL")))

  ;;(add-to-list 'custom-theme-load-path (file-name-as-directory "~/.emacs.d/mycolor"))
  (setq-default line-spacing 2)
  (set-frame-font "ＭＳ ゴシック-9")

  (require 'howm)
  (setq howm-file-name-format "%Y/%m/%Y_%m_%d_%H%M%S.org") ; 1 日 1 ファイル
  (setq howm-keyword-case-fold-search t) ; <<< で大文字小文字を区別しない

  ;;evilにeyebrowseのコマンドをexとして登録する
  (eval-after-load 'evil-ex '(progn
                              (evil-ex-define-cmd "taba" 'eyebrowse-switch-to-window-config-1)
                              (evil-ex-define-cmd "tabb" 'eyebrowse-switch-to-window-config-2)
                              (evil-ex-define-cmd "tabc" 'eyebrowse-switch-to-window-config-3)
                              (evil-ex-define-cmd "tabd" 'eyebrowse-switch-to-window-config-4)
                              (evil-ex-define-cmd "tabe" 'eyebrowse-switch-to-window-config-5)
                              (evil-ex-define-cmd "tabf" 'eyebrowse-switch-to-window-config-6)
                              (evil-ex-define-cmd "tabg" 'eyebrowse-switch-to-window-config-7)
                              (evil-ex-define-cmd "tabh" 'eyebrowse-switch-to-window-config-8)
                              (evil-ex-define-cmd "tabt" 'eyebrowse-switch-to-window-config-9)
                              (evil-ex-define-cmd "tabm" 'eyebrowse-switch-to-window-config-0)
                              (evil-ex-define-cmd "tabl" 'eyebrowse-switch-to-window-config)))

  (require 'dired+)
  (setq diredp-hide-details-initially-flag t)

  (add-to-list 'load-path (file-name-as-directory "~/.emacs.d/myel"))
  (require 'ox-qmd)

  ;;emacs-lisp用
  ;;tooltipでヘルプを表示
  (defun my-e-doc (symbol)
    (or (ignore-errors (documentation symbol))
        (ignore-errors (documentation-property symbol 'variable-documentation))))
  (defun doc-at-point ()
    (interactive)
    (let* ((symbol (symbol-at-point))
           (doc (my-e-doc symbol)))
      (when (and doc (null popup-instances))
        (popup-tip doc :margin t))))
  ;;evalにedocとしてexコマンド登録
  (eval-after-load 'evil-ex '(evil-ex-define-cmd "edoc" 'doc-at-point))


  ;;辞書をポップアップしたい
  (defun mydic (b e)
    (interactive "r")
    (if (and (region-active-p) (>= (- e b) 2))
        (popup-tip (concat " " (buffer-substring b e) " "))
      (popup-tip "not found")))

  (defun w32-browser (doc) (w32-shell-execute 1 doc))
  (eval-after-load "dired" '(define-key dired-mode-map [f3]
                              (lambda ()
                                (interactive)
                                (w32-browser (dired-replace-in-string "/" "\\" (dired-get-filename))))))

  ;;popupメニュー
  (define-key popup-menu-keymap (kbd "C-l") 'popup-open)
  (define-key popup-menu-keymap (kbd "C-h") 'popup-close)
  (defun mypopup ()
    "test of popup-menu"
    (interactive)
    (let ((m (popup-cascade-menu '(Conemu-Here Explorer Close) )))
      (cond ((eq m 'Conemu-Here)
             (let ((x (file-name-directory (buffer-file-name))))
               (w32-shell-execute "open" "conemu" (concat "-dir " (file-name-directory (buffer-file-name))))))
            ((eq m 'Explorer)
             (let ((x (file-name-directory (buffer-file-name))))
               (explorer x))))))
  (eval-after-load 'evil-ex '(evil-ex-define-cmd "pop" 'mypopup))

  (defun my-gvim-on-dired ()
    "open gvim from dired"
    (interactive)
    (let ((f (dired-get-filename)))
      ;;NTEmacsとvimで$HOMEが異なるので_gvimrcを指定して開く
      (w32-shell-execute "open" "gvim" (concat "-U ~/../../_gvimrc " f))
      ))
  (eval-after-load 'evil-ex '(evil-ex-define-cmd "vim" 'my-gvim-on-dired))


  ;;以下メモ
  ;;(buffer-file-name)
  ;;(directory-file-name (buffer-file-name))
  ;;(file-name-directory (buffer-file-name))

  ;;空ファイルを作成する
  (defun mytouch (fname)
    "create empty file using touch.bat"
    (interactive "sInput File Name:")
    (if (< 0 (length fname))
        (progn (start-process "mytouch" nil "c:\\ueno\\touch.cmd" fname)
               (revert-buffer))))

  ;;Dired/nameのnormalステートのキーを上書く
  (evil-define-key 'normal dired-mode-map (kbd "c") #'mytouch)
  (evil-define-key 'normal dired-mode-map (kbd "i") #'dired-hide-details-mode)
  (evil-define-key 'normal dired-mode-map (kbd "g t") #'eyebrowse-next-window-config)
  (evil-define-key 'normal dired-mode-map (kbd "g T") #'eyebrowse-prev-window-config)

  ;;起動時の設定
  (eyebrowse-switch-to-window-config-9)
  (find-file "~/todo.org")
  (let ((win (split-window-below)))
     (select-window win))
  (find-file "~/.emacs.d/mymemo.org")
  (eyebrowse-switch-to-window-config-0)
  (howm-menu)

  (setq org-agenda-files (list "~/todo.org"))

  ;; plantuml.jarへのパスを設定
  ;; あと、dotの場所PATH or 下記環境変数で指定する
  ;; set GRAPHVIZ_DOT=C:\ueno\tool\graphviz\bin\dot.exe
  (setq org-plantuml-jar-path "~/.emacs.d/lib/plantuml.jar")

  ;;babel実行時に確認を求めない
  (setq org-confirm-babel-evaluate nil)

  ;;babel言語の設定
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t)(mermaid . t)(plantuml . t)))

  ;;evil-normal stateでIMEをOFFする
  (add-hook 'evil-normal-state-entry-hook 'ime-force-off)

  ;;exploreを開く
  (defun explorer (&optional path)
    "引数があれば引数の、省略されていれば現在のバッファをexplorerで開く"
    (interactive)
    (setq path (expand-file-name (or path (buffer-file-name))))
    (cond
     ((not (file-exists-p path))
      (message "path %s isn't exist" path))
     (t
      (let ((dos-path (replace-regexp-in-string "/" "\\\\" path)))
        ;;(w32-shell-execute "open" "explorer.exe" (concat "/select," dos-path))))))
        (w32-shell-execute "open" "explorer.exe" dos-path)))))

  ;;diredから
  (defun dired-exec-explorer ()
    "In dired, execute Explorer"
    (interactive)
    (explorer (dired-current-directory)))
  ;;key map
  (define-key dired-mode-map (kbd "C-c e") 'dired-exec-explorer)

  (defun my-new-frame-and-view ()
    (let* ((x (dired-get-filename))
          (w (frame-width))
          (h (frame-height))
          (f (new-frame `((width . ,w) (height . ,h)))))
          ))
  

  (define-key dired-mode-map (kbd "C-c o") 'my-new-frame-and-view)

  ;;拡張子に対するモードの指定
  (add-to-list 'auto-mode-alist '("\\.PRC\\'" . sql-mode))

  (add-hook 'sql-mode-hook 'my-tag-set)
  (defun my-tag-set ()
    (let ((tagpath (my-find-tags (buffer-file-name))))
      (if (file-exists-p tagpath) (setq tags-file-name tagpath))))

  (defun my-find-tags (path)
    (let ((dir (file-name-as-directory path))
          (prev "")
          (ret nil))
      (while (not (string= dir prev))
        (if (file-exists-p (concat dir "etags"))
            (setq ret (concat dir "etags")
                  dir prev)
            (setq prev dir
                  dir (file-name-directory (directory-file-name dir)))))
      ret))

  ;;(file-name-as-directory "c:\\temp") -> 末尾に区切り文字を付ける
  ;;(directory-file-name "c:\\temp\\") -> 末尾の区切り文字を消す
  ;;(file-name-directory "c:\\temp\\aaa") -> 親ディレクトリを返す(末尾に区切り文字付)

  ;;日本の休日
  (eval-after-load "holidays"
    '(progn
       (require 'japanese-holidays)
       (setq calendar-holidays ; 他の国の祝日も表示させたい場合は適当に調整
             (append japanese-holidays holiday-local-holidays holiday-other-holidays))
       (setq mark-holidays-in-calendar t) ; 祝日をカレンダーに表示
       ;; 土曜日・日曜日を祝日として表示する場合、以下の設定を追加します。
       ;; デフォルトで設定済み
       (setq japanese-holiday-weekend '(0 6)     ; 土日を祝日として表示
             japanese-holiday-weekend-marker     ; 土曜日を水色で表示
             '(holiday nil nil nil nil nil japanese-holiday-saturday))
       (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
       (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)))

  ;;“きょう”をマークするには以下の設定を追加します。
  (add-hook 'calendar-today-visible-hook 'calendar-mark-today)

  (require 'dired-ranger)
  ;;このアクションから始まる(コピー)
  (define-key dired-mode-map (kbd "C-c c") 'dired-ranger-copy)

  ;;コピーした後に移動
  (define-key dired-mode-map (kbd "C-c x") 'dired-ranger-move)
  ;;コピーした後に貼り付け
  (define-key dired-mode-map (kbd "C-c v") 'dired-ranger-paste)


  (require 'ox-reveal)
  (require 'ace-jump-mode)
  (define-key global-map (kbd "C-c j") 'ace-jump-mode)
  (evil-define-key 'normal global-map (kbd "s") #'ace-jump-mode)

  (require 'url-http)
  (require 'calfw)
  (require 'calfw-ical)
  ;;(require 'calfw-howm)
  (require 'calfw-org)
  (setq cfw:ical-calendar-external-shell-command "MyWGet -u nmoc\\8010973 -p CatsVer302 ")
  (setq cfw:ical-url-to-buffer-get 'cfw:ical-url-to-buffer-external)
  ;;(setq cfw:ical-url-to-buffer-get 'cfw:ical-url-to-buffer-internal)
  ;; 月
  (setq calendar-month-name-array
        ["１月" "２月" "３月" "４月" "５月" "６月"
         "７月" "８月" "９月" "１０月" "１１月" "１２月"])

  ;; 曜日
  (setq calendar-day-name-array
        ["日曜日" "月曜日" "火曜日" "水曜日" "木曜日" "金曜日" "土曜日"])

  ;; 週の先頭の曜日
  (setq calendar-week-start-day 0) ; 日曜日は0, 月曜日は1

  (require 'hiwin)
  (hiwin-activate)
  (set-face-background 'hiwin-face "#222222")

  (require 'yasnippet)
  (yas-global-mode 1)
  (define-key global-map (kbd "C-c y") 'yas-insert-snippet)

  ;;(yas-insert-snippet)
  ;;(yas-new-snippet)
  ;;(yas-visit-snippet-file)
  ;;(require 'helm-migemo)
  ;; ================================================================
  ;; end ofdotspacemacs/user-config 
  ;; ================================================================
  )

;; (cfw:ical-data-cache-clear-all)
(defun my-open-cal ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    ;;(cfw:howm-create-source "Blue")  ; howm source
    ;;(cfw:cal-create-source "Orange") ; diary source
    ;;(cfw:ical-create-source "gcal" "~/basic.ics" "Gray")  ; ICS source1
    (cfw:ical-create-source "gcal" "https://calendar.google.com/calendar/ical/ueno.denshi.kobo%40gmail.com/private-6366861ff1b9ef34ec2265ad65e4465a/basic.ics" "Gray")  ; ICS source1
    ;;(cfw:ical-create-source "gcal" "https://..../basic.ics" "IndianRed") ; google calendar ICS)
    )))
  ;;(cfw:open-ical-calendar "https://calendar.google.com/calendar/ical/ueno.denshi.kobo%40gmail.com/private-6366861ff1b9ef34ec2265ad65e4465a/basic.ics"))
  ;;(cfw:open-ical-calendar "file:///c:/temp/basic.ics"))

(defun my-window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h         )
               (shrink-window-horizontally dx))
              ((= c ?k)
               (enlarge-window dy))
              ((= c ?j)
               (shrink-window dy))
	      ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (hiwin calfw-org dired-ranger ox-reveal calfw-howm japanese-holidays calfw-ical calfw ace-jump-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package tss toc-org tide spacemacs-theme spaceline smooth-scrolling restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file neotree move-text lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize howm hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag graphviz-dot-mode google-translate golden-ratio gnuplot flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu elisp-slime-nav dired-toggle dired+ define-word company-statistics company-quickhelp clean-aindent-mode buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-slime ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#60ba60" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "outline" :family "ＭＳ ゴシック"))))
 '(font-lock-keyword-face ((t (:foreground "gold" :weight normal))))
 '(font-lock-string-face ((t (:foreground "gainsboro")))))
