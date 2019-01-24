(add-to-list 'load-path "~/.emacs.d/haru-pack/evil")
(add-to-list 'load-path "~/.emacs.d/haru-pack/howm")
(add-to-list 'load-path "~/.emacs.d/haru-pack/async")
(add-to-list 'load-path "~/.emacs.d/haru-pack/ivy")
(add-to-list 'load-path "~/.emacs.d/haru-pack/company")
(add-to-list 'load-path "~/.emacs.d/haru-pack/flycheck")
(add-to-list 'load-path "~/.emacs.d/haru-pack/omnisharp")
(add-to-list 'load-path "~/.emacs.d/haru-pack/typescript-mode")
(add-to-list 'load-path "~/.emacs.d/haru-pack/ng2-mode")
(add-to-list 'load-path "~/.emacs.d/haru-pack")
(add-to-list 'load-path "~/.emacs.d/haru")


;; ���������Ԍv���p
;; �N�����M-x initchart-visualize-init-sequence�Ń`���[�g�쐬
;; (require 'initchart)
;; (initchart-record-execution-time-of load file)
;; (initchart-record-execution-time-of require feature)

;;(global-linum-mode t)
(require 'nlinum)
(global-nlinum-mode t)


;;C-x, C-f��find-file��default directory��"~/"�ɂ���
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;; character code �ݒ�
(set-keyboard-coding-system 'utf-8)
 
(prefer-coding-system 'utf-8-dos)
;;(prefer-coding-system 'utf-8-unix)
 
(set-file-name-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))


;ctrl-u��evil�ɐH�킷
(setq-default evil-want-C-u-scroll t)
;emacs�X�e�[�g�ł�C-w���E�B���h�E�ړ��R�}���h�Ɋ��蓖�Ă�
(setq-default evil-want-C-w-in-emacs-state t)
(setq evil-search-module 'evil-search)
(setq evil-ex-search-vim-style-regexp t)
(setq evil-auto-indent nil)
;;�J�X�^�}�C�Y�ϐ���require�̑O�ɍs��
(require 'evil)
(evil-mode 1)
;;evil-normal state��IME��OFF����
(add-hook 'evil-normal-state-entry-hook 'ime-force-off)

(require 'evil-search-highlight-persist)
(evil-search-highlight-persist)
(require 'evil-visualstar)
(global-evil-visualstar-mode t)
(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'avy)
;; key bind "SPC SPC s"


;; load-path��undo-tree.el�����݂��Ȃ��ƃG���[�ɂȂ�
(require 'undo-tree)

;; �c�[���o�[���\��
(tool-bar-mode 0)

;; �e�[�}
(load-theme 'tsdh-dark t)

(setq howm-process-coding-system 'utf-8-dos)
;; busybox grep����ripgrep�ɏ�芷��
;; (setq howm-view-use-grep t) ;[buxybox grep %1 %2...]��bat��windows�t�H���_�ɒu���Ă���

(setq howm-view-use-grep t)
(setq howm-view-grep-command "rg") ;rg.exe��windows�t�H���_�ɒu���Ă���
(setq howm-view-grep-option "-nH --no-heading --color never")
(setq howm-view-grep-extended-option nil)
(setq howm-view-grep-fixed-option "-F")
(setq howm-view-grep-expr-option nil)
(setq howm-view-grep-file-stdin-option nil)

(setq howm-menu-lang 'ja)
(require 'howm-mode)

(setq howm-file-name-format "%Y/%m/%Y_%m_%d_%H%M%S.org") ; 1 �� 1 �t�@�C��
(setq howm-keyword-case-fold-search t) ; <<< �ő啶������������ʂ��Ȃ�


(require 'url-http)
(require 'calfw)
(require 'calfw-ical)
(require 'calfw-org)

;; MyWGet��c:\windows�ɒu���Ă����ipath���ʂ��Ă�΂ǂ��ł��ǂ���j
(setq cfw:ical-calendar-external-shell-command "MyWGet -u nmoc\\8010973 -p CatsVer308 ")
(setq cfw:ical-url-to-buffer-get 'cfw:ical-url-to-buffer-external)
;; ��
(setq calendar-month-name-array
    ["�P��" "�Q��" "�R��" "�S��" "�T��" "�U��"
     "�V��" "�W��" "�X��" "�P�O��" "�P�P��" "�P�Q��"])

;; �j��
(setq calendar-day-name-array
    ["���j��" "���j��" "�Ηj��" "���j��" "�ؗj��" "���j��" "�y�j��"])

;; �T�̐擪�̗j��
(setq calendar-week-start-day 0) ; ���j����0, ���j����1
;;���{�̋x��
(eval-after-load "holidays"
'(progn
    (require 'japanese-holidays)
    (setq calendar-holidays ; ���̍��̏j�����\�����������ꍇ�͓K���ɒ���
	    (append japanese-holidays holiday-local-holidays holiday-other-holidays))
    (setq mark-holidays-in-calendar t) ; �j�����J�����_�[�ɕ\��
    ;; �y�j���E���j�����j���Ƃ��ĕ\������ꍇ�A�ȉ��̐ݒ��ǉ����܂��B
    ;; �f�t�H���g�Őݒ�ς�
    (setq japanese-holiday-weekend '(0 6)     ; �y�����j���Ƃ��ĕ\��
	    japanese-holiday-weekend-marker     ; �y�j���𐅐F�ŕ\��
	    '(holiday nil nil nil nil nil japanese-holiday-saturday))
    (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
    (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)))

;;�g���傤�h���}�[�N����ɂ͈ȉ��̐ݒ��ǉ����܂��B
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)

;; �J�����_�[����SPC�ŌĂ΂��ڍ׉�ʂ�cfw�̃L�[�}�b�v��D��
;; �ł�hjkl��evil�ōs������
;; https://tarao.hatenablog.com/entry/20130304/evil_config#keymap-override
(evil-make-overriding-map cfw:details-mode-map 'normal)
(evil-add-hjkl-bindings cfw:details-mode-map 'normal)


;; �܂��悭�킩���ĂȂ��̂�
;; https://docs.projectile.mx/en/latest/
;; (require 'projectile)
(require 'counsel-projectile)
;; C-c p�ɑ����ĉ������͂���Ɨǂ����ۂ�
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-indexing-method 'native)
;; (setq projectile-indexing-method 'hybrid)  ; windows���ᓮ���Ȃ�
;; (setq projectile-indexing-method 'alien)   ; windows���ᓮ���Ȃ�
;; M-x counsel-projectile-mode
;; M-x projectile-discover-projects-in-directory.
;; �v���W�F�N�g�̃��[�g��.projetile���쐬
;; ��������t�@�C���Ƃ��f�B���N�g���Ƃ����L�q����
;; (node_modules�Ƃ����ɍs���ƃN�\�x��)

;;=======================================
;;hiwin
;;=======================================
(require 'hiwin)
(hiwin-activate)
(set-face-background 'hiwin-face "#333333")
(custom-set-faces
'(default ((t
           (:background "#080808" :foreground "#AAFFAA")
           ))))

;;=======================================
;;eyebrowse
;;=======================================
(require 'eyebrowse)
(eyebrowse-mode t)
(eyebrowse-switch-to-window-config-1)
(eyebrowse-switch-to-window-config-2)
(eyebrowse-switch-to-window-config-3)
(eyebrowse-switch-to-window-config-4)
(eyebrowse-switch-to-window-config-5)
(eyebrowse-switch-to-window-config-6)
(eyebrowse-switch-to-window-config-7)
(eyebrowse-switch-to-window-config-8)
(eyebrowse-switch-to-window-config-9)
(eyebrowse-switch-to-window-config-0)
(setq eyebrowse-wrap-around t)


;;�g���q�ɑ΂��郂�[�h�̎w��
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

;;(file-name-as-directory "c:\\temp") -> �����ɋ�؂蕶����t����
;;(directory-file-name "c:\\temp\\") -> �����̋�؂蕶��������
;;(file-name-directory "c:\\temp\\aaa") -> �e�f�B���N�g����Ԃ�(�����ɋ�؂蕶���t)




;;�܂�Ԃ��Ȃ�
(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)
;;(setq default-tab-width 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
;; ���s���̎����C���f���goff
(electric-indent-mode -1)
(setq-default tab-stop-list '(0 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                          64 68 72 76 80 84 88 92 96 100 104 108 112
                          116 120))
;; memo: emacs�Ń^�u��������͂���ɂ�C-q TAB

;; (setq-default indent-line-function 'tab-to-tab-stop)

(column-number-mode 1)

;; trailing space
(setq-default show-trailing-whitespace t)
(set-face-attribute 'trailing-whitespace nil :background "#FFBB88")

;; �Θb���Ƃ�trailing whitespace�𖳌��ɂ���
(defun my/disable-trailing-mode-hook ()
  "Disable show tail whitespace."
  (setq show-trailing-whitespace nil))

(defvar my/disable-trailing-modes
  '(comint-mode
    eshell-mode
    eww-mode
    term-mode
    twittering-mode))

(mapc
 (lambda (mode)
   (add-hook (intern (concat (symbol-name mode) "-hook"))
             'my/disable-trailing-mode-hook))
 my/disable-trailing-modes)




(require 'org)
(setq org-fast-todo-selection t)
;(setq org-todo-keywords
;      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "Done(x)" "CANCEL(c)")))
(setq org-todo-keywords
	'((sequence "TODO" "STARTED" "WAITING" "|" "Done" "CANCEL")))
(setq org-startup-indented t)
(setq org-src-fontify-natively t)

;;(add-to-list 'custom-theme-load-path (file-name-as-directory "~/.emacs.d/mycolor"))
(setq-default line-spacing 2)
(set-frame-font "�l�r �S�V�b�N-9")

(setq org-agenda-files (list "~/todo.org" "~/work.org"))

;; plantuml.jar�ւ̃p�X��ݒ�
;; ���ƁAdot�̏ꏊPATH or ���L���ϐ��Ŏw�肷��
;; set GRAPHVIZ_DOT=C:\ueno\tool\graphviz\bin\dot.exe
(setq org-plantuml-jar-path "~/.emacs.d/lib/plantuml.jar")

;;babel���s���Ɋm�F�����߂Ȃ�
(setq org-confirm-babel-evaluate nil)

;;babel����̐ݒ�
(org-babel-do-load-languages
  'org-babel-load-languages
  '((dot . t)(mermaid . t)(plantuml . t)(sql . t)))

;;done��������t��ǉ�
;;or
;;#+STARTUP: logdone
(setq org-log-done 'time)


;;=======================================
;;popup
;;=======================================
(require 'popup)
(define-key popup-menu-keymap (kbd "C-l") 'popup-open)
(define-key popup-menu-keymap (kbd "C-h") 'popup-close)


;;=======================================
;;dired
;;=======================================
(require 'dired+)
(require 'dired-toggle)

(defun w32-browser (doc) (w32-shell-execute 1 doc))
(eval-after-load "dired" '(define-key dired-mode-map [f3]
                            (lambda ()
                              (interactive)
                              (w32-browser (dired-replace-in-string "/" "\\" (dired-get-filename))))))
(defun dired-exec-explorer ()
"In dired, execute Explorer"
(interactive)
(explorer (dired-current-directory)))

(defun my-gvim-on-dired ()
  "open gvim from dired"
  (interactive)
  (let ((f (dired-get-filename)))
	;;NTEmacs��vim��$HOME���قȂ�̂�_gvimrc���w�肵�ĊJ��
	(w32-shell-execute "open" "gvim" (concat "-U ~/../../_gvimrc " f))
	))

(setq dired-recursive-copies 'always)
;;=======================================
;;�֐���`
;;=======================================
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
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

;;explore���J��
(defun explorer (&optional path)
"����������Έ����́A�ȗ�����Ă���Ό��݂̃o�b�t�@��explorer�ŊJ��"
(interactive)
(setq path (expand-file-name (or path (buffer-file-name))))
(cond
	((not (file-exists-p path))
	(message "path %s isn't exist" path))
	(t
	(let ((dos-path (replace-regexp-in-string "/" "\\\\" path)))
	;;(w32-shell-execute "open" "explorer.exe" (concat "/select," dos-path))))))
	(w32-shell-execute "open" "explorer.exe" dos-path)))))


;;�J�����_�[
(defun my-open-cal ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    ;;(cfw:howm-create-source "Blue")  ; howm source
    ;;(cfw:cal-create-source "Orange") ; diary source
    ;;(cfw:ical-create-source "gcal" "~/basic.ics" "Gray")  ; ICS source1
    (cfw:ical-create-source "gcal"  "https://calendar.google.com/calendar/ical/ueno.denshi.kobo%40gmail.com/private-6366861ff1b9ef34ec2265ad65e4465a/basic.ics" "Gray")  ; ICS source1
    (cfw:ical-create-source "gcal2" "https://calendar.google.com/calendar/ical/hv8flar7naf9foikor7e4p5pg0%40group.calendar.google.com/private-cc25cfc08ca6ff992a8c6a414aabaa7c/basic.ics" "Orange")  ; ICS source1
    ;;(cfw:ical-create-source "gcal" "https://..../basic.ics" "IndianRed") ; google calendar ICS)
    )))

(w32-shell-execute "open" "C:\\ueno\\prog\\OrgNotification\\OrgNotification.exe" )

;;��t�@�C�����쐬����
(defun mytouch (fname)
  "create empty file using touch.bat"
  (interactive "sInput File Name:")
  (if (< 0 (length fname))
	  (progn (start-process "mytouch" nil "c:\\ueno\\touch.cmd" fname)
			 (revert-buffer))))

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


;;=======================================
;;����
;;=======================================
;; M-x recentf-open-files�Ŏ��s�ł���
(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 1000)            ;; recentf �ɕۑ�����t�@�C���̐�
(setq recentf-exclude '(".recentf"))           ;; .recentf���̂͊܂܂Ȃ�
(setq recentf-auto-cleanup 'never)             ;; �ۑ�������e�𐮗�
(run-with-idle-timer 30 t '(lambda ()          ;; 30�b���Ƃ� .recentf ��ۑ�
   (with-suppressed-message (recentf-save-list))))
(recentf-mode 1)
(require 'recentf-find-file)
;; M-x recentf-find-file��ivy����recentf


;;=======================================
;; �s�Ԑݒ�
;;======================================
;;�����Ŏw�肷��ƃs�N�Z������
;;�����Ŏw�肷��ƍs�̍����ɑ΂��đ��Βl�Őݒ肳���
(setq-default line-spacing 2)

;;=======================================
;; �t�H���g
;;=======================================
(set-frame-font "�l�r �S�V�b�N-9")

;;;;�o�b�N�A�b�v�����Ȃ�
(setq make-backup-files nil)
(setq auto-save-default nil)

;;;;�o�b�t�@�̏I�������߂�
(setq-default indicate-empty-lines t)

;;;;�t�@�C���̍ŏI�s�ŉ��s����������
(setq-default require-final-newline t)

;;;;�A���_�[�X�R�A��P��̋��E�Ƃ��Ȃ�(vim�Ɠ����ɂ���)
(modify-syntax-entry ?_ "w" (standard-syntax-table))



;;=======================================
;;ivy(�⊮)
;;=======================================
(require 'ivy)
(require 'counsel)
(ivy-mode 1)
(counsel-mode 1)
(setq ivy-initial-inputs-alist nil)  ; without `^`
;; following is ivy default
;;(setq ivy-re-builders-alist '((t . ivy--regex-plus)))
(setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
(setq ivy-use-virtual-buffers t)
(setq ivy-height 20)
(define-key ivy-minibuffer-map (kbd "TAB") 'ivy-alt-done)  ; TAB�Q��Ō��肪���Ȃ̂ŏ㏑��


;;=======================================
;;company
;;=======================================
(require 'company)
(global-company-mode) ; �S�o�b�t�@�ŗL���ɂ���

(set-face-attribute 'company-tooltip nil :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil :background "orange")
(set-face-attribute 'company-scrollbar-bg nil :background "gray40")

;; fuck, TAGS -> ETAGS
;; company�Œ�`����Ă���֐����㏑��
(defun company-etags-find-table ()
  (let ((file (expand-file-name
               "etags"
               (locate-dominating-file (or buffer-file-name
                                           default-directory)
                                       "etags"))))
    (when (and file (file-regular-p file))
      (list file))))



;;=======================================
;;�L�[�{�[�h
;;=======================================
;;;; dired-find-alternate-file �̗L����
(put 'dired-find-alternate-file 'disabled nil)
;;;; RET �W���� dired-find-file �ł� dired �o�b�t�@�����������̂�
;;;; dired-find-alternate-file �����Ɏg��
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "a") 'dired-find-file)
(evil-define-key 'normal dired-mode-map (kbd "n") 'evil-search-next)
(evil-define-key 'normal dired-mode-map (kbd "N") 'evil-search-previous)
(evil-define-key 'normal dired-mode-map (kbd "gt") 'eyebrowse-next-window-config)
(evil-define-key 'normal dired-mode-map (kbd "gT") 'eyebrowse-prev-window-config)


(eval-after-load 'evil-ex
    '(progn
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
(define-key evil-normal-state-map "gt" 'eyebrowse-next-window-config)
(define-key evil-normal-state-map "gT" 'eyebrowse-prev-window-config)
(evil-ex-define-cmd "gt" 'eyebrowse-next-window-config)
(evil-ex-define-cmd "gT" 'eyebrowse-prev-window-config)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map [tab] 'company-complete-selection)
(define-key company-active-map (kbd "C-k") 'company-abort)
(define-key global-map (kbd "C-SPC") 'company-complete)

(define-key evil-normal-state-map " rr" 'recentf-find-file)
(define-key evil-normal-state-map " ff" 'counsel-find-file)
(define-key evil-normal-state-map " bb" 'switch-to-buffer)  ;; C-x b�ł��ǂ�
(define-key evil-normal-state-map "  s" 'avy-goto-char)
(define-key evil-normal-state-map "  /" 'swiper)
(define-key evil-normal-state-map " ch" 'counsel-command-history)
(define-key evil-normal-state-map "  x" 'counsel-M-x)
(define-key evil-normal-state-map " dt" 'dired-toggle)

(global-set-key [C-tab] 'other-window)

;; emacs�X�e�[�g�ɑ΂���
(define-key package-menu-mode-map (kbd "j") 'next-line)
(define-key package-menu-mode-map (kbd "k") 'previous-line)
(define-key package-menu-mode-map (kbd "h") 'backward-char)
(define-key package-menu-mode-map (kbd "l") 'forward-char)
(define-key package-menu-mode-map (kbd "/") 'evil-search-forward)
(define-key package-menu-mode-map (kbd "n") 'evil-search-next)
(define-key package-menu-mode-map (kbd "N") 'evil-search-previous)
(define-key package-menu-mode-map (kbd "G") 'evil-goto-line)

(define-key help-mode-map (kbd "gt") 'eyebrowse-next-window-config)
(define-key help-mode-map (kbd "gT") 'eyebrowse-prev-window-config)

;;=======================================
;;typescript-mode
;;=======================================
(autoload 'typescript-mode "typescript-mode" "Major mode for editing typescript code." t)
(setq auto-mode-alist
  (append '(("\\.ts$" . typescript-mode)) auto-mode-alist))

;;=======================================
;;ng2-mode
;;=======================================
(autoload 'ng2-mode "ng2-mode" "Major mode for editing angular2 code." t)
(setq auto-mode-alist
	  (append '(("\\.component.ts$" . ng2-mode)) auto-mode-alist))

;;=======================================
;;csharp-mode
;;=======================================
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
  (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;;=======================================
;;omnicsharp-mode
;;omnisharp--do-server-start@omnisharp-server-management.el��
;;start-process�̈�����SPACE��ǉ�����
;;=======================================
(require 'omnisharp)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))
(add-hook 'csharp-mode-hook #'company-mode)
(setq omnisharp-server-executable-path "C:\\ueno\\tool\\omnisharp\\OmniSharp.exe")
(setq omnisharp-debug t)


;;=======================================
;;MY�J�X�^���N�����
;;=======================================
(eyebrowse-switch-to-window-config-9)
(find-file "~/todo.org")
(let ((win (split-window-below)))
  (select-window win))
(find-file "~/.emacs.d/mymemo.org")
(split-window-right)
(find-file "~/work.org")
(other-window 2)
(eyebrowse-switch-to-window-config-0)
(setq inhibit-splash-screen t)
(howm-menu)
(org-agenda nil "n")




;;;;ddskk���J�n���� 
;(skk-mode) 
;;;;l�Ŕ��p 
;;;;C-j�őS�p���� 
;;;;�S�p���Ȏ���q�őS�p�J�i 
;;;;�ϊ�����q�ł��J�i�ɂȂ� 
;;;;�ϊ����̑O����x�L�[�ł� 
;; (require 'skk)
;; (define-key minibuffer-local-map (kbd "C-j") 'skk-kakutei)

;; skk��slime�̃X�y�[�X�̖����������� 
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
;;;;�ǂ�����Ă������������ł��Ȃ������̂� 
;;;;slime.el����ŏC�����ăL�[�o�C���h���R�����g�A�E�g���� 
