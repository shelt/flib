;; TODO understand what a button needs to be to be drawn
;; and what a map object needs to be drawn to the map which is then drawn to the window

;;;;;;;;;;;;;;;;REDESIGN THESE PROCEDURES;;;;;;;;;;;;;;;;;;;;
;; draw-scene -> (draw-obj obj window-surf)
;; obj        -> (sdil2:blit-surface obj)

(define (obj-rect obj)
  (let ((w (sdl2:surface-w (obj-surface obj)))
        (h (sdl2:surface-h (obj-surface obj))))
    (sdl2:make-rect (- (obj-x obj) (/ w 2))
                   (- (obj-y obj) (/ h 2))
                   w
                   h)))

(define (draw-obj! obj dest)
  (sdl2:blit-surface! (obj-surface obj) #f dest (obj-rect obj)))

(define (draw-scene!)
  (let ((window-surf (sdl2:window-surface window)))
    ;; Clear the whole screen using a blue background color
    (sdl2:fill-rect! window-surf #f (sdl2:make-color 0 80 160))
    ;; Draw the smileys
    (draw-obj! smiley2 window-surf)
    (draw-obj! smiley1 window-surf)
    ;; Refresh the screen
    (sdl2:update-window-surface! window)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Event loop
;; TODO compartmentalize, structure, remove redundancy.
(let ((done #f)
      (verbose? #f))
  (while (not done)
    (let ((ev (sdl2:wait-event!)))

      (when verbose?
        (print ev))

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
