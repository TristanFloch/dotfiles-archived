(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/Documents/orgfiles/"))
 '(org-capture-templates
   '(("a" "Appointment" entry
      (file "gcal.org")
      "* %?
%^T

:PROPERTIES:
:END:
")
     ("l" "Links" entry
      (file+headline "links.org" "Links")
      "* %x %^g
" :prepend t :immediate-finish t)
     ("t" "Personal todo" entry
      (file+headline +org-capture-todo-file "Inbox")
      "* TODO %?
%i" :prepend t)
     ("n" "Personal notes" entry
      (file+headline +org-capture-notes-file "Inbox")
      "* %u %?
%i
%a" :prepend t)
     ("j" "Journal" entry
      (file+olp+datetree +org-capture-journal-file)
      "* %U %?
%i
%a" :prepend t)
     ("p" "Templates for projects")
     ("pt" "Project-local todo" entry
      (file+headline +org-capture-project-todo-file "Inbox")
      "* TODO %?
%i
%a" :prepend t)
     ("pn" "Project-local notes" entry
      (file+headline +org-capture-project-notes-file "Inbox")
      "* %U %?
%i
%a" :prepend t)
     ("pc" "Project-local changelog" entry
      (file+headline +org-capture-project-changelog-file "Unreleased")
      "* %U %?
%i
%a" :prepend t)
     ("o" "Centralized templates for projects")
     ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?
 %i
 %a" :heading "Tasks" :prepend nil)
     ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?
 %i
 %a" :prepend t :heading "Notes")
     ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?
 %i
 %a" :prepend t :heading "Changelog")))
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.7 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
     ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-time-stamp-custom-formats '("<%m/%d/%y %a>" . "<%m/%d/%y %a %H:%M>"))
 '(org-todo-keyword-faces
   '(("[-]" . +org-todo-active)
     ("PROGRESS" . +org-todo-active)
     ("[?]" . +org-todo-onhold)
     ("WAIT" . +org-todo-onhold)
     ("HOLD" . +org-todo-onhold)
     ("PROJ" . +org-todo-project)))
 '(org-todo-keywords
   '((type "TODO(t)" "PROGRESS(i)" "PROJ(p)" "WAIT(w)" "HOLD(h)" "|" "DONE(d)" "CANCELLED(k)")
     (sequence "[ ](T)" "[-](P)" "[?](W)" "|" "[X](D)")))
 '(safe-local-variable-values '((projectile-project-compilation-dir . build))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
