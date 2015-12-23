
This document describes the changes in each version of chicken-sdl2.

This library follows "[semantic versioning](http://semver.org)".
Until version 1.0.0 is released, the API is not guaranteed to be "stable".
That means the maintainer reserves the right to change the API if needed,
possibly in ways that break backwards compatibility with previous versions.
**Large backwards-incompatible changes are unlikely**,
but there may be small tweaks and fixes to the API if problems are discovered.

After version 1.0.0 is released, the API is guaranteed to remain stable (no backwards-incompatible changes)
until the next new major version (e.g. going from version 1.x to 2.0.0, or 2.x to 3.0.0).


# 0.1.0 (2015-12-19)

Initial release. The following procedures were included:

## General

Initialization and cleanup:

```
set-main-ready!
init!                              init-subsystem!
quit!                              quit-subsystem!
was-init
```

Miscellaneous:

```
get-error                          set-error!                         clear-error!
get-platform
screen-saver-enabled?              screen-saver-enabled-set!
has-clipboard-text?                get-clipboard-text                 set-clipboard-text!
```

Struct memory management:

```
struct-null?
```


## Color

Related to the **sdl2:color** struct record type
(each procedure has an alias spelled as "colour"):

```
color?                   colour?
make-color               make-color*              free-color!
make-colour              make-colour*             free-colour!
color-r                  color-r-set!             colour-r                 colour-r-set!
color-g                  color-g-set!             colour-g                 colour-g-set!
color-b                  color-b-set!             colour-b                 colour-b-set!
color-a                  color-a-set!             colour-a                 colour-a-set!
color-set!                                        colour-set!
color->list                                       colour->list
color=?                                           colour=?
copy-color                                        copy-colour
copy-color*                                       copy-colour*
```


## Event

```
event-state                        event-state-set!
flush-event!                       flush-events!
has-event?                         has-events?                        quit-requested?
get-events!                        peek-events                        poll-event!
pump-events!                       push-event!
wait-event!                        wait-event-timeout!
register-events!
```

Related to the **sdl2:event** struct record type:

```
event?
make-event                         make-event*                        free-event!
event-type                         event-type-set!                    event-type-raw
event-timestamp                    event-timestamp-set!
```

Related to the **sdl2:controller-axis-event** variant:

```
controller-axis-event?
controller-axis-event-which        controller-axis-event-which-set!
controller-axis-event-axis         controller-axis-event-axis-set!
controller-axis-event-value        controller-axis-event-value-set!
```

Related to the **sdl2:controller-button-event** variant:

```
controller-button-event?
controller-button-event-which      controller-button-event-which-set!
controller-button-event-button     controller-button-event-button-set!
controller-button-event-state      controller-button-event-state-set!
```

Related to the **sdl2:controller-device-event** variant:

```
controller-device-event?
controller-device-event-which      controller-device-event-which-set!
```

Related to the **sdl2:dollar-gesture-event** variant:

```
dollar-gesture-event?
dollar-gesture-event-touch-id      dollar-gesture-event-touch-id-set!
dollar-gesture-event-gesture-id    dollar-gesture-event-gesture-id-set!
dollar-gesture-event-num-fingers   dollar-gesture-event-num-fingers-set!
dollar-gesture-event-error         dollar-gesture-event-error-set!
dollar-gesture-event-x             dollar-gesture-event-x-set!
dollar-gesture-event-y             dollar-gesture-event-y-set!
```

Related to the **sdl2:drop-event** variant:

```
drop-event?
drop-event-file                    drop-event-file-set!
```

Related to the **sdl2:joy-axis-event** variant:

```
joy-axis-event?
joy-axis-event-which               joy-axis-event-which-set!
joy-axis-event-axis                joy-axis-event-axis-set!
joy-axis-event-value               joy-axis-event-value-set!
```

Related to the **sdl2:joy-ball-event** variant:

```
joy-ball-event?
joy-ball-event-which               joy-ball-event-which-set!
joy-ball-event-ball                joy-ball-event-ball-set!
joy-ball-event-xrel                joy-ball-event-xrel-set!
joy-ball-event-yrel                joy-ball-event-yrel-set!
```

Related to the **sdl2:joy-button-event** variant:

```
joy-button-event?
joy-button-event-which             joy-button-event-which-set!
joy-button-event-button            joy-button-event-button-set!
joy-button-event-state             joy-button-event-state-set!
```

Related to the **sdl2:joy-device-event** variant:

```
joy-device-event?
joy-device-event-which             joy-device-event-which-set!
```

Related to the **sdl2:joy-hat-event** variant:

```
joy-hat-event?
joy-hat-event-which                joy-hat-event-which-set!
joy-hat-event-hat                  joy-hat-event-hat-set!
joy-hat-event-value                joy-hat-event-value-set!           joy-hat-event-value-raw
```

Related to the **sdl2:keyboard-event** variant:

```
keyboard-event?
keyboard-event-window-id           keyboard-event-window-id-set!
keyboard-event-state               keyboard-event-state-set!
keyboard-event-repeat              keyboard-event-repeat-set!
keyboard-event-keysym              keyboard-event-keysym-set!
keyboard-event-scancode            keyboard-event-scancode-set!       keyboard-event-scancode-raw
keyboard-event-sym                 keyboard-event-sym-set!            keyboard-event-sym-raw
keyboard-event-mod                 keyboard-event-mod-set!            keyboard-event-mod-raw
```

Related to the **sdl2:mouse-button-event** variant:

```
mouse-button-event?
mouse-button-event-window-id       mouse-button-event-window-id-set!
mouse-button-event-which           mouse-button-event-which-set!
mouse-button-event-button          mouse-button-event-button-set!     mouse-button-event-button-raw
mouse-button-event-state           mouse-button-event-state-set!
mouse-button-event-x               mouse-button-event-x-set!
mouse-button-event-y               mouse-button-event-y-set!
```

Related to the **sdl2:mouse-motion-event** variant:

```
mouse-motion-event?
mouse-motion-event-window-id       mouse-motion-event-window-id-set!
mouse-motion-event-which           mouse-motion-event-which-set!
mouse-motion-event-state           mouse-motion-event-state-set!      mouse-motion-event-state-raw
mouse-motion-event-x               mouse-motion-event-x-set!
mouse-motion-event-y               mouse-motion-event-y-set!
mouse-motion-event-xrel            mouse-motion-event-xrel-set!
mouse-motion-event-yrel            mouse-motion-event-yrel-set!
```

Related to the **sdl2:mouse-wheel-event** variant:

```
mouse-wheel-event?
mouse-wheel-event-window-id        mouse-wheel-event-window-id-set!
mouse-wheel-event-which            mouse-wheel-event-which-set!
mouse-wheel-event-x                mouse-wheel-event-x-set!
mouse-wheel-event-y                mouse-wheel-event-y-set!
```

Related to the **sdl2:multi-gesture-event** variant:

```
multi-gesture-event?
multi-gesture-event-touch-id       multi-gesture-event-touch-id-set!
multi-gesture-event-dtheta         multi-gesture-event-dtheta-set!
multi-gesture-event-ddist          multi-gesture-event-ddist-set!
multi-gesture-event-x              multi-gesture-event-x-set!
multi-gesture-event-y              multi-gesture-event-y-set!
multi-gesture-event-num-fingers    multi-gesture-event-num-fingers-set!
```

Related to the **sdl2:quit-event** variant:

```
quit-event?
```

Related to the **sdl2:sys-wm-event** variant:

```
sys-wm-event?
sys-wm-event-msg-raw               sys-wm-event-msg-raw-set!
```

Related to the **sdl2:text-editing-event** variant:

```
text-editing-event?
text-editing-event-window-id       text-editing-event-window-id-set!
text-editing-event-text            text-editing-event-text-set!
text-editing-event-start           text-editing-event-start-set!
text-editing-event-length          text-editing-event-length-set!
```

Related to the **sdl2:text-input-event** variant:

```
text-input-event?
text-input-event-window-id         text-input-event-window-id-set!
text-input-event-text              text-input-event-text-set!
```

Related to the **sdl2:touch-finger-event** variant:

```
touch-finger-event?
touch-finger-event-touch-id        touch-finger-event-touch-id-set!
touch-finger-event-finger-id       touch-finger-event-finger-id-set!
touch-finger-event-x               touch-finger-event-x-set!
touch-finger-event-y               touch-finger-event-y-set!
touch-finger-event-dx              touch-finger-event-dx-set!
touch-finger-event-dy              touch-finger-event-dy-set!
touch-finger-event-pressure        touch-finger-event-pressure-set!
```

Related to the **sdl2:user-event** variant:

```
user-event?
user-event-window-id               user-event-window-id-set!
user-event-code                    user-event-code-set!
user-event-data1-raw               user-event-data1-raw-set!
user-event-data2-raw               user-event-data2-raw-set!
```

Related to the **sdl2:window-event** variant:

```
window-event?
window-event-window-id             window-event-window-id-set!
window-event-event                 window-event-event-set!            window-event-event-raw
window-event-data1                 window-event-data1-set!
window-event-data2                 window-event-data2-set!
```


## Joystick

```
num-joysticks                      joystick-open!                     joystick-close!
joystick-update!                   joystick-event-state               joystick-event-state-set!
joystick-name-for-index
joystick-get-device-guid           joystick-get-guid-from-string
```

Related to the **sdl2:joystick** struct record type:

```
joystick?
joystick-attached?
joystick-name
joystick-num-axes                  joystick-get-axis
joystick-num-balls                 joystick-get-ball
joystick-num-buttons               joystick-get-button
joystick-num-hats                  joystick-get-hat                   joystick-get-hat-raw
joystick-instance-id               joystick-get-guid
```

Related to the **sdl2:joystick-guid** struct record type:

```
joystick-guid?                     free-joystick-guid!
joystick-get-guid-string
```


## Keyboard

```
get-key-from-name                  get-key-from-name-raw
get-key-from-scancode              get-key-from-scancode-raw
get-key-name
get-scancode-from-name             get-scancode-from-name-raw
get-scancode-from-key              get-scancode-from-key-raw
get-scancode-name
get-keyboard-focus
scancode-pressed?
mod-state                          mod-state-set!                     mod-state-raw
text-input-rect-set!
start-text-input!                  stop-text-input!                   text-input-active?
screen-keyboard-support?           screen-keyboard-shown?
```

Related to the **sdl2:keysym** struct record type:

```
keysym?
make-keysym                        make-keysym*                       free-keysym!
keysym-scancode                    keysym-scancode-set!               keysym-scancode-raw
keysym-sym                         keysym-sym-set!                    keysym-sym-raw
keysym-mod                         keysym-mod-set!                    keysym-mod-raw
```


## OpenGL integration

```
gl-create-context!                 gl-delete-context!                 gl-make-current!
gl-get-current-window              gl-get-current-context
gl-attribute                       gl-attribute-set!                  gl-reset-attributes!
gl-get-drawable-size
gl-swap-window!                    gl-swap-interval                   gl-set-swap-interval!
gl-extension-supported?
```

Related to the **sdl2:gl-context** struct record type:

```
gl-context?
```


## Palette

Related to the **sdl2:palette** struct record type:

```
palette?
make-palette                       make-palette*                      free-palette!
palette-ncolors                    palette-ncolours
palette-ref                        palette-set!
palette-colors                     palette-colours
palette-colors-set!                palette-colours-set!
```


## Pixel Format

```
map-rgb                            map-rgba
get-rgb                            get-rgba
pixel-format-enum-to-masks
```

Related to the **sdl2:pixel-format** struct record type:

```
pixel-format?
make-pixel-format                  make-pixel-format*                 free-pixel-format!
pixel-format-format                pixel-format-format-raw
pixel-format-palette               pixel-format-palette-set!
pixel-format-bits-per-pixel
pixel-format-bytes-per-pixel
pixel-format-rmask
pixel-format-gmask
pixel-format-bmask
pixel-format-amask
```


## Rect / Point

```
rect-empty?                        enclose-points                     has-intersection?
intersect-rect                     intersect-rect-and-line            union-rect
```

Related to the **sdl2:rect** struct record type:

```
rect?
make-rect                          make-rect*                         free-rect!
rect-x                             rect-x-set!
rect-y                             rect-y-set!
rect-w                             rect-w-set!
rect-h                             rect-h-set!
rect-set!                          rect->list                         rect=?
copy-rect                          copy-rect*
```

Related to the **sdl2:point** struct record type:

```
point?
make-point                         make-point*                        free-point!
point-x                            point-x-set!
point-y                            point-y-set!
point-set!                         point->list                        point=?
copy-point                         copy-point*
```


## RWops

```
rw-from-file                       rw-from-const-mem                  rw-from-mem
rw-from-blob                       rw-from-string
rw-close!
```

Related to the **sdl2:rwops** struct record type:

```
rwops?
rwops-type                         rwops-type-raw
```


## Surface

```
create-rgb-surface*                create-rgb-surface-from*           convert-surface
load-bmp                           load-bmp*
load-bmp-rw                        load-bmp-rw*
save-bmp!                          save-bmp-rw!
lock-surface!                      unlock-surface!                    must-lock?
blit-surface!                      blit-scaled!
fill-rect!                         fill-rects!
rotate-surface-90                  rotate-surface-90*
flip-surface                       flip-surface*
```

Related to the **sdl2:surface** struct record type:

```
surface?
make-surface                       make-surface*                      free-surface!
surface-format
surface-w
surface-h
surface-pitch
surface-pixels-raw
surface-userdata-raw               surface-userdata-raw-set!
surface-refcount                   surface-refcount-set!
surface-ref                        surface-set!                       surface-ref-raw
surface-clip-rect                  surface-clip-rect-set!
surface-color-key                  surface-color-key-set!             surface-color-key-raw
surface-colour-key                 surface-colour-key-set!            surface-colour-key-raw
surface-alpha-mod                  surface-alpha-mod-set!
surface-blend-mode                 surface-blend-mode-set!            surface-blend-mode-raw
surface-color-mod                  surface-colour-mod
surface-color-mod-set!             surface-colour-mod-set!
surface-palette                    surface-palette-set!
surface-rle-set!
```


## Timer

```
delay!                             get-ticks
get-performance-counter            get-performance-frequency
```


## Touch / Gesture

```
get-num-touch-devices              get-touch-device
get-num-touch-fingers              get-touch-finger
```

Related to the **sdl2:finger** struct record type:

```
finger?
finger-id
finger-x                           finger-y
finger-pressure
```


## Version

```
version-at-least?                  compiled-version                   current-version
```


## Window / Display Mode

```
create-window!                     destroy-window!                    get-window-from-id
update-window-surface!             update-window-surface-rects!
show-window!                       hide-window!                       raise-window!
maximize-window!                   minimize-window!                   restore-window!
```

Related to the **sdl2:window** struct record type:

```
window?
window-id
window-bordered?                   window-bordered-set!
window-brightness                  window-brightness-set!
window-display-index
window-display-mode                window-display-mode-set!
window-flags                       window-flags-raw
window-fullscreen                  window-fullscreen-set!
window-grab?                       window-grab-set!
window-icon-set!
window-maximum-size                window-maximum-size-set!
window-minimum-size                window-minimum-size-set!
window-pixel-format                window-pixel-format-raw
window-position                    window-position-set!
window-size                        window-size-set!
window-surface
window-title                       window-title-set!
```

Related to the **sdl2:display-mode** struct record type:

```
display-mode?
make-display-mode                  make-display-mode*                 free-display-mode!
display-mode-format                display-mode-format-set!           display-mode-format-raw
display-mode-w                     display-mode-w-set!
display-mode-h                     display-mode-h-set!
display-mode-refresh-rate          display-mode-refresh-rate-set!
```
