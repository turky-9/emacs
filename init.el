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

;(setq url-proxy-services
;    '(("http" . "10.111.1.200:8080")
;      ("https" . "10.111.1.200:8080")))

;(load-theme 'wheatgrass t)
;(load-theme 'tango-dark t)
(load-theme 'tsdh-dark t)


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(require 'evil)
(evil-mode 1)
(require 'evil-search-highlight-persist)
(evil-search-highlight-persist)


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
              ((= c ?h)
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

;折り返さない
(setq-default truncate-lines t)


;履歴
(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 1000)            ;; recentf に保存するファイルの数
(setq recentf-exclude '(".recentf"))           ;; .recentf自体は含まない
(setq recentf-auto-cleanup 'never)             ;; 保存する内容を整理
(run-with-idle-timer 30 t '(lambda ()          ;; 30秒ごとに .recentf を保存
   (with-suppressed-message (recentf-save-list))))
(require 'recentf-ext)
(global-set-key "\C-c\M-r" 'recentf-open-files)

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

(require 'helm)
