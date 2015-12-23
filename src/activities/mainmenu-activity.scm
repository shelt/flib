(define (mainmenu-activity window)
  (let* ((window-surface (sdl2:window-surface window))
         (x (util:surface-cx window-surface))
         (y (floor (/ (sdl2:surface-h window-surface) 3)))
         (logo (make-ui-obj x y (img:load "assets/logo.png"))))

    ;; TODO make better, maybe generalize or make simpler (can be used elsewhere)
    (define (draw-elements elements)
      (if (not (null? elements))
        ((car elements) 'draw window-surface)
        (draw-elements (cdr elements))))

    (util:clear-surface window-surface)
    (logo 'draw window-surface)
    (sdl2:update-window-surface! window)

    ));TODO

;;;;; TODO TODO TODO Current goal:
; when event occurs, activity-specific event loop calls general event loop
; returns false if it didn't handle the event.
; ALSO: generalize the draw-element procedure


;TODO indent
;TODO this loop is example code
(let ((done #f))
  (while (not done)
    (let ((ev (sdl2:wait-event!)))
      (case (sdl2:event-type ev)
        ;; Window exposed, resized, etc.
        ((window)
         (draw-scene!))

        ;; User requested app quit (e.g. clicked the close button).
        ((quit)
         (set! done #t))

        ;; Joystick added (plugged in)
        ((joy-device-added)
         ;; Open the joystick so we start receiving events for it.
         (sdl2:joystick-open! (sdl2:joy-device-event-which ev)))

        ;; Mouse button pressed
        ((mouse-button-down)
         ;; Move smiley1 to the mouse position.
         (set! (obj-x smiley1) (sdl2:mouse-button-event-x ev))
         (set! (obj-y smiley1) (sdl2:mouse-button-event-y ev))
         (draw-scene!))

        ;; Mouse cursor moved
        ((mouse-motion)
         ;; If any button is being held, move smiley1 to the cursor.
         ;; This way it seems like you are dragging it around.
         (when (not (null? (sdl2:mouse-motion-event-state ev)))
           (set! (obj-x smiley1) (sdl2:mouse-motion-event-x ev))
           (set! (obj-y smiley1) (sdl2:mouse-motion-event-y ev))
           (draw-scene!)))

        ;; Keyboard key pressed.
        ((key-down)
         (case (sdl2:keyboard-event-sym ev)
           ;; Escape or Q quits the program
           ((escape q)
            (set! done #t))

           ;; V toggles verbose printing of events
           ((v)
            (if verbose?
                (begin
                  (print "Verbose OFF (events will not be printed)")
                  (set! verbose? #f))
                (begin
                  (print "Verbose ON (events will be printed)")
                  (set! verbose? #t))))

           ;; Space bar randomizes smiley colors
           ((space)
            (randomize-smiley! smiley1)
            (randomize-smiley! smiley2)
            (draw-scene!))

           ;; Arrow keys control smiley2
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
