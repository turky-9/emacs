;;C-x, C-fのfind-fileのdefault directoryを"~/"にする
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;;load-path に init.elが置いてあるディレクトリも加える。
;;また別の個別の環境設定ファイルを設置するかもしれない時に便利
;;(setq load-path
;;      (cons
;;       (expand-file-name "~/.emacs.d/") load-path))

;; 行番号を表示
(global-linum-mode t)
 
;; character code 設定
(set-keyboard-coding-system 'utf-8)
 
(prefer-coding-system 'utf-8-dos)
;;(prefer-coding-system 'utf-8-unix)
 
(set-file-name-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))

(setq url-proxy-services
    '(("http" . "10.111.1.200:8080")
      ("https" . "10.111.1.200:8080")))

;(load-theme 'wheatgrass t)
;(load-theme 'tango-dark t)
(load-theme 'tsdh-dark t)
(add-to-list 'custom-theme-load-path (file-name-as-directory "~/.emacs.d/mycolor"))
;(load-theme 'desert t t)
;(enable-theme 'desert)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;ctrl-uをevilに食わす
(setq-default evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(require 'evil-search-highlight-persist)
(evil-search-highlight-persist)
(require 'evil-visualstar)
(global-evil-visualstar-mode t)

(add-to-list 'load-path (file-name-as-directory "~/.emacs.d/myel"))
(require 'evil-mode-line)



(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ
(global-auto-complete-mode t)

;(require 'tabbar)
;(tabbar-mode 0)

;;; プレフィクスキーはC-z
;(setq elscreen-prefix-key (kbd "C-z"))
;(elscreen-start)

(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")
(tss-config-default)

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
(global-set-key "\C-c\C-r" 'my-window-resizer)


;履歴
(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 1000)            ;; recentf に保存するファイルの数
(setq recentf-exclude '(".recentf"))           ;; .recentf自体は含まない
(setq recentf-auto-cleanup 'never)             ;; 保存する内容を整理
(run-with-idle-timer 30 t '(lambda ()          ;; 30秒ごとに .recentf を保存
   (with-suppressed-message (recentf-save-list))))
;(require 'recentf-ext)
;(global-set-key "\C-c\M-r" 'recentf-open-files)
(global-set-key "\C-c\M-r" 'helm-recentf)

(global-evil-tabs-mode t)

;;;;ddskkを開始する 
;(skk-mode) 
;;;;lで半角 
;;;;C-jで全角かな 
;;;;全角かな時にqで全角カナ 
;;;;変換時にqでもカナになる 
;;;;変換時の前候補はxキーです 

;; コピーした内容を PRIMARY,CLIPBOARD セクションにもコピーする 
;;(set-clipboard-coding-system 'compound-text) 
;;(cond (window-system (setq x-select-enable-clipboard t) )) 

;;C-yでclipboardの内容をペーストする 
;;クリップボードの内容を追加するとそちらが優先されます 
;;kill-ringに 新らしい内容を追加するとそちらが優先されます 
;;(cond (window-system (global-set-key "\C-y" 'x-clipboard-yank))) 


;;clispを設定 
(setq inferior-lisp-program "clisp") 
(require 'slime) 
(slime-setup '(slime-repl slime-fancy slime-banner)) 


(require 'ac-slime) 
(add-hook 'slime-mode-hook 'set-up-slime-ac) 
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac) 

;; skkとslimeのスペースの問題を解決する 
;(defun skk-slime-space-insert (n) 
;  (interactive "p") 
;  (if skk-henkan-mode (skk-insert) (slime-space n))) 
;(add-hook 'slime-mode-hook 
;	  (lambda() 
;	    (define-key slime-mode-map " " 'skk-slime-space-insert))) 
;(add-hook 'slime-repl-mode-hook 
;	  (lambda() 
;	    (define-key slime-repl-mode-map " " 'skk-slime-space-insert))) 
; 
;;;;どうやっても競合を解決できなかったので 
;;;;slime.elを手で修正してキーバインドをコメントアウトした 

;=======================================
; 行間設定
;====================================
;;整数で指定するとピクセル数で
;;少数で指定すると行の高さに対して相対値で設定される
(setq-default line-spacing 2)

;=======================================
; フォント
;=======================================
(set-frame-font "ＭＳ ゴシック-9")

;折り返さない
(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)

(require 'helm-config)
(helm-mode 1)

;;;;バックアップを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;;;;diredをhjklで移動するための設定
;;(evil-make-overriding-map dired-mode-map 'normal)
;;(evil-define-key 'normal dired-mode-map
;;  ";" (lookup-key evil-motion-state-map ";")
;;  "k" 'dired-previous-line                    ; 人差し指
;;  "j" 'dired-next-line                        ; 中指
;;  "h" 'dired-up-directory                     ; 人差し指の左
;;  "l" 'keu-dired-down-directory               ; 薬指
;;  "m" (lookup-key evil-normal-state-map "m")
;;  "w" (lookup-key evil-normal-state-map "w")
;;  (kbd "SPC")   (lookup-key dired-mode-map "m")
;;  (kbd "S-SPC") (lookup-key dired-mode-map "d")
;;  )
;;
;;(defun keu-dired-down-directory ()
;;  "[Dired command] Go down to the directory."
;;  (interactive)
;;  (condition-case err
;;      (let path (dired-get-file-for-visit)
;;        (if (file-directory-p path)
;;            (dired-find-file)
;;            (message "This is not directory!")))
;;    (error (message "%s" (cadr err)))))

(define-key dired-mode-map (kbd "h") 'dired-up-directory)
(define-key dired-mode-map (kbd "j") 'dired-next-line)
(define-key dired-mode-map (kbd "k") 'dired-previous-line)

;;;; dired-find-alternate-file の有効化
(put 'dired-find-alternate-file 'disabled nil)
;;;; RET 標準の dired-find-file では dired バッファが複数作られるので
;;;; dired-find-alternate-file を代わりに使う
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "a") 'dired-find-file)

;;;;バッファの終わりを示めす
(setq-default indicate-empty-lines t)

;;;;ファイルの最終行で改行を強制する
(setq-default require-final-newline t)

;;;;アンダースコアを単語の境界としない(vimと同じにする)
(modify-syntax-entry ?_ "w" (standard-syntax-table))

(global-set-key [C-tab] 'other-window)

;;;;めもです
(define-key global-map (kbd "C-c j") (lambda ()(interactive)(find-file "~/todo.org")))
(define-key global-map (kbd "C-c p j") (lambda ()(interactive)(find-file "~/.emacs.d/mymemo.org")))

;;;;org関連
(require 'org)
(setq org-fast-todo-selection t)
;(setq org-todo-keywords
;      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "Done(x)" "CANCEL(c)")))
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "|" "Done" "CANCEL")))
