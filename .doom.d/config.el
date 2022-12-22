;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Philipp Dmitrov"
      user-mail-address "dmitrov.philipp@yandex.ru")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "mononoki Nerd Font" :size 16 :weight 'semi-light))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
(defun my/frame-recenter (&optional frame)
  "Center FRAME on the screen.
FRAME can be a frame name, a terminal name, or a frame.
If FRAME is omitted or nil, use currently selected frame."
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.8) (left . 0.5)))))

(defun my/frame-prior-size ()
  (when window-system (set-frame-size (selected-frame) 280 85)))

  (my/frame-prior-size)
  (my/frame-recenter)

(setq tab-width 2)
(setq-default evil-shift-width 2)


(global-tree-sitter-mode)

(defun my/lsp-run ()
  (interactive)
  (lsp!)
  (tree-sitter-hl-mode)
  (lsp-toggle-on-type-formatting))

;; Owl mode
(evil-owl-mode)

(setq evil-owl-display-method 'window)

(add-to-list 'display-buffer-alist
             '("*evil-owl*"
               (display-buffer-below-selected)
               (window-height . 0.5)))

(setq evil-owl-idle-delay 0.3)
(setq evil-owl-local-mark-format " %m: %l:%c\n    %s")
(setq evil-owl-global-mark-format " %m: %l:c %b\n    %s")

(setq doom-themes-treemacs-theme "doom-colors")

(map! :leader
      :desc "win2"
      "0" #'treemacs-select-window)
(map! :leader
      :desc "win1"
      "1" #'winum-select-window-1)
(map! :leader
      :desc "win2"
      "2" #'winum-select-window-2)
(map! :leader
      :desc "win3"
      "3" #'winum-select-window-3)
(map! :leader
      :desc "win4"
      "4" #'winum-select-window-4)
(map! :leader
      :desc "win5"
      "5" #'winum-select-window-5)
(map! :leader
      :desc "win6"
      "6" #'winum-select-window-6)
(map! :leader
      :desc "win7"
      "7" #'winum-select-window-7)
(map! :leader
      :desc "win8"
      "8" #'winum-select-window-8)
(map! :leader
      :desc "win9"
      "9" #'winum-select-window-9)
;; Remap some defaults
(map! :leader
      :desc "save"
      "w" #'save-buffer)
