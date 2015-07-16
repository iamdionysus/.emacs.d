(defun outlook-open-message-from-buffer ()
  "Opens outlook email message from buffer"
  (interactive)
  (shell-command-on-region (point-min) (point-max) "powershell -command \" $input | outlook-open-message-with \""))
