(require-extension posix)

(define (splash-activity window)
  (let* ((window-surface (sdl2:window-surface window))
         (x (util:surface-cx window-surface))
         (y (util:surface-cy window-surface))
         (splash (make-ui-img x y #f (img:load "assets/splash/ghost.png"))))
    (util:clear-surface window-surface)
    (splash 'draw window-surface #f)
    (sdl2:update-window-surface! window)
    (sleep const:splash-time)))
