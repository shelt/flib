(define (mainmenu-activity window)
  (let* ((window-surface (sdl2:window-surface window))
         (x (util:surface-cx window-surface))
         (y (floor (/ (sdl2:surface-h window-surface) 3)))
         (logo (make-ui-obj x y (img:load "assets/logo.png"))))

    ;; TODO make better, maybe generalize or make simpler (can be used elsewhere)
    (define (draw-scene! elements)
      (if (not (null? elements))
        ((car elements) 'draw window-surface)
        (draw-scene! (cdr elements))))

    (util:clear-surface window-surface)
    (logo 'draw window-surface)
    (sdl2:update-window-surface! window)

    ));TODO

;TODO indent
(let ((done #f))
  (while (not done)
    (let ((ev (sdl2:wait-event!)))
      ;; GENERIC EVENTS ;;
      (case (sdl2:event-type ev)
        ;; Window exposed, resized, etc.
        ((window)
         (draw-scene! elements ev))

        ;; User requested app quit
        ((quit)
         (set! done #t))

        ;; Keyboard key pressed.
        ((key-down)
         (case (sdl2:keyboard-event-sym ev)
           ;; Quit program TODO exit prompt for mainmenu, pause menu for game
           ((escape) ;; TODO and move it to activity-specific obviously
            (set! done #t))

      ;; ACTIVITY-SPECIFIC EVENTS ;;

           ;; Space bar randomizes smiley colors TODO
           ((space)
            (randomize-smiley! smiley1)
            (randomize-smiley! smiley2)
            (draw-scene!))

           ;; Arrow keys control smiley2 TODO
           ((left)
            (dec! (obj-x smiley2) 20)
            (draw-scene!))
           ((right)
            (inc! (obj-x smiley2) 20)
            (draw-scene!))
           ((up)
            (dec! (obj-y smiley2) 20)
            (draw-scene!))
           ((down)
            (inc! (obj-y smiley2) 20)
            (draw-scene!))))))))

        ;; Mouse button pressed
        ((mouse-button-down)
          (draw-scene! elements ev)

        ;; Mouse cursor moved
        ((mouse-motion)
          (draw-scene! elements ev)
         ;;TODO example code below
         ;; If any button is being held, move smiley1 to the cursor.
         ;; This way it seems like you are dragging it around.
         (when (not (null? (sdl2:mouse-motion-event-state ev)))
           (set! (obj-x smiley1) (sdl2:mouse-motion-event-x ev))
           (set! (obj-y smiley1) (sdl2:mouse-motion-event-y ev))
           (draw-scene!)))
