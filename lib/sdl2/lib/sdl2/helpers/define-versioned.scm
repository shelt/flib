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


;;; Define a procedure that requires a minimum version of SDL. If
;;; chicken-sdl2 was COMPILED WITH a sufficient version of SDL, the
;;; function body will be executed. Otherwise, an error will be thrown
;;; to explain the version requirement.
;;;
;;; Usage:
;;;
;;;   (define-versioned (VMAJOR VMINOR VPATCH) (FN-NAME FN-ARG ...)
;;;     BODY ...)
;;;
;;; VMAJOR, VMINOR, and VPATCH are integers specifying the minimum
;;; required version of SDL.
;;;
;;; FN-NAME is the name of the procedure to define. It will be defined
;;; by this macro.
;;;
;;; FN-ARG ... are the procedure arguments, like you would specify
;;; with a normal procedure definition or lambda.
;;;
;;; BODY ... are the procedure body expressions that will be executed
;;; if the version requirement is met. If the requirement is not met,
;;; the body is ignored and an erorr is thrown instead.
;;;
;;; Example:
;;;
;;;   ;; Requires SDL 2.0.1 or higher.
;;;   (define-versioned (2 0 1) (ticks-passed? a b)
;;;     (SDL_TICKS_PASSED a b))
;;;
(define-syntax define-versioned
  (syntax-rules ()
    ((define-versioned (vmajor vminor vpatch)
       (fn-name fn-arg ...)
       body ...)
     (define fn-name
       (if (version-at-least? vmajor vminor vpatch)
           (lambda (fn-arg ...)
             body ...)
           (lambda (fn-arg ...)
             (error
              'fn-name
              (apply sprintf
                "requires SDL ~A.~A.~A or higher.~NCurrently compiled with SDL ~A.~A.~A."
                vmajor vminor vpatch
                (compiled-version)))))))))
