;;; recentf-find-file.el --- complete reading recef   -*- lexical-binding: t; -*-

;; Copyright (C) 2016, 2018 fubuki

;; Author: fubuki@*****.org
;; Keywords: files

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Open value `recentf-list' with `completing-read'.

;;; Installation:

;; (require 'recentf-find-file)

;;; Code:

(require 'recentf)

(defcustom recentf-find-file-prompt "recentf: "
  "recentf-find-file prompt."
  :type   'string
  :group  'recentf)

(defvar recentf-alist nil) ; Work Value

(defun recentf-find-file-make-complete-alist ()
  (setq recentf-alist nil)
  (dolist (path (reverse recentf-list))
    (setq recentf-alist
          (cons (cons (file-name-nondirectory path) path) recentf-alist))))

(advice-add 'recentf-track-opened-file :after 'recentf-find-file-make-complete-alist)

(defun recentf-find-file (&optional prefix)
  "Open value `recentf-list' with `completing-read'."
  (interactive "P")
  (let (name)
    (if (not recentf-alist) (recentf-find-file-make-complete-alist))
    (setq name (completing-read recentf-find-file-prompt recentf-alist))
    (switch-to-buffer (find-file-noselect (cdr (assoc name recentf-alist))))
    (when prefix (setq buffer-read-only t))))

(provide 'recentf-find-file)
;; fin.
