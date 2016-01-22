;TODO unused

(require-extension sdl2)

(use (prefix sdl2 sdl2:)
     (prefix sdl2-image img:)
     miscmacros)

(declare (uses util))
(declare (uses const))
(declare (uses objects/ui))
(declare (uses activities/splash))
(declare (uses activities/mainmenu))

(printf "## Flib v0.1a ##\n")
(printf "Running with SDL ~A~N\n" (sdl2:current-version))

;;; Initialize SDL parts
(sdl2:set-main-ready!)
(sdl2:init! '(video events))

;; Automatically call sdl2:quit! when program exits normally.
(on-exit sdl2:quit!)

;; Call sdl2:quit! and then call the original exception handler if an
;; unhandled exception reaches the top level.
(current-exception-handler
 (let ((original-handler (current-exception-handler)))
   (lambda (exception)
     (sdl2:quit!)
     (original-handler exception))))

;;; Create window
(define window
  (sdl2:create-window!
   "Flib"                          ; title
   'centered  100                       ; x, y
   800  600                             ; w, h
   '(resizable fullscreen-desktop borderless)))                 ; flags


(splash-activity window)
(mainmenu-activity window)
(printf "\n* Exiting without error! :)\n")
(exit)
