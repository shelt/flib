;TODO modify from mainmenu activity
(define (mainmenu-activity window)
  (let* ((window-surface (sdl2:window-surface window)))

    (define (draw-scene! elements ev)
      (util:clear-surface window-surface)
      (util:draw-elements! elements ev)
      (sdl2:update-window-surface! window))

    (define drawables (list
      (make-ui-img
        (util:surface-cx window-surface)
        (floor (/ (sdl2:surface-h window-surface) 3))
        #t (img:load "assets/logo.png"))
      (make-ui-basic-button
        (util:surface-cx window-surface)
        (floor (/ (sdl2:surface-h window-surface) 2))
        #t (img:load "assets/ui/mainmenu/button_newgame.png") (lambda () (game-activity window #f)))))
      ; TODO load menu
      ; TODO settings menu
      ; TODO quit button
                            

    (let ((done #f))
      (while (not done)
        (let ((ev (sdl2:wait-event!)))
          (set! window-surface (sdl2:window-surface window))
          ;; GENERIC EVENTS ;;
          (case (sdl2:event-type ev)
            ;; Window exposed, resized, etc.
            ((window)
             (draw-scene! drawables ev))

            ;; User requested app quit
            ((quit)
             (set! done #t))

            ;; Keyboard key pressed.
            ((key-down)
              (case (sdl2:keyboard-event-sym ev)
                ((escape) ;; TODO and move it to activity-specific obviously
                  (set! done #t))))

          ;; ACTIVITY-SPECIFIC EVENTS ;;

            ;; Mouse button pressed
            ((mouse-button-down mouse-button-up mouse-motion)
              (draw-scene! drawables ev))))))))
