(require-extension posix)

(define (splash-activity window bgcolor)
  (let* ((window-surface (sdl2:window-surface window))
         (x (/ (sdl2:surface-w window-surface) 2))
         (y (/ (sdl2:surface-h window-surface) 2))
        (logo (make-ui-obj x y (img:load "assets/splash/ghost.png"))))
    (sdl2:fill-rect! window-surface #f bgcolor)
    (sdl2:blit-surface! (logo 'surface?) #f window-surface (logo 'rect?))
    (sdl2:update-window-surface! window)
    (sleep 5)))
