;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tristan Floch"
      user-mail-address "tristan.floch@epita.fr")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-material)
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 18))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Sets a scroll offset (as in Vim)
(setq scroll-margin 10)

(setq org-directory "~/Documents/orgfiles/")
(after! org
  (require 'org-superstar)
  (add-hook 'org-mode-hook (lambda() (org-superstar-mode 1)))
  (setq org-ellipsis " ▾"
        org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶"))
  (add-to-list 'org-capture-templates
               '("l" "Links" entry (file+headline "links.org" "Links")
                  "* %x %^g\n"
                  :immediate-finish t
                  :prepend t))
  (add-to-list 'org-capture-templates
               '("a" "Appointment" entry (file "gcal.org")
                 "* %?\n%^T\n\n:PROPERTIES:\n:END:\n"))) ;; Date needs to be set twice

;; Syncs gcal after capturing an appointment
;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

(after! company
  (setq company-idle-delay 0))

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)
;; (set-frame-parameter (selected-frame) 'alpha '(95 . 85))
;; (add-to-list 'default-frame-alist '(alpha . (95 . 85)))

;; Clang stuff
(load "/usr/share/clang/clang-format.el")
(require 'clang-format)
(global-set-key [C-M-tab] 'clang-format-buffer)

(setq clang-format-style-option "file")

;; Change the binding of the Org capture
(map! :leader
      :desc "Org Capture"           "x" #'org-capture
      :desc "Pop up scratch buffer" "X" #'doom/open-scratch-buffer)


(require 'org-gcal)
(setq org-gcal-client-id "517191471377-0g7snp1jneht2s8tmqth900nf13t9vbl.apps.googleusercontent.com"
      org-gcal-client-secret "fZNQra_7a10Zqd4CIx8mBpKU"
      org-gcal-file-alist '(("tristan.floch@gmail.com" .  "~/Documents/orgfiles/gcal.org")))



;; Weekly view in the agenda and log of what I've done during the day
(after! org-agenda
  (setq org-agenda-span 'week)
  (setq org-agenda-start-with-log-mode '(clock)))

(add-to-list 'org-latex-packages-alist
             '("AUTO" "babel" t ("pdflatex")))

(magit-define-popup-switch 'magit-push-popup
  ?c "Follow tags" "--follow-tags")

