;;
;; chicken-sdl2: CHICKEN Scheme bindings to Simple DirectMedia Layer 2
;;
;; Copyright © 2013, 2015  John Croisant.
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;;
;; - Redistributions of source code must retain the above copyright
;;   notice, this list of conditions and the following disclaimer.
;;
;; - Redistributions in binary form must reproduce the above copyright
;;   notice, this list of conditions and the following disclaimer in
;;   the documentation and/or other materials provided with the
;;   distribution.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
;; FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;; COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
;; INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
;; STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
;; OF THE POSSIBILITY OF SUCH DAMAGE.


(export joystick-guid?
        wrap-joystick-guid
        unwrap-joystick-guid
        %joystick-guid-pointer
        %joystick-guid-pointer-set!
        free-joystick-guid!
        %alloc-joystick-guid*
        %alloc-joystick-guid)

(define-struct-record-type
  sdl2:joystick-guid "SDL_JoystickGUID"
  pred:    joystick-guid?
  wrap:    wrap-joystick-guid
  unwrap:  unwrap-joystick-guid
  (pointer %joystick-guid-pointer
           %joystick-guid-pointer-set!))

(define-struct-memory-helpers
  "SDL_JoystickGUID"
  using: (wrap-joystick-guid
          joystick-guid?
          %joystick-guid-pointer
          %joystick-guid-pointer-set!)
  define: (free-joystick-guid!
           %alloc-joystick-guid*
           %alloc-joystick-guid))

(define-struct-record-printer sdl2:joystick-guid
  %joystick-guid-pointer
  show-address: #t)
