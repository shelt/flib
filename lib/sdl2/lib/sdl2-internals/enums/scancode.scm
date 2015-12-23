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


(export scancode->symbol
        symbol->scancode)


(define-enum-mappings
  type: SDL_Scancode
  value->symbol: (scancode->symbol
                  %scancode->symbol-table)
  symbol->value: (symbol->scancode
                  %symbol->scancode-table)

  ((SDL_SCANCODE_UNKNOWN             unknown)

   (SDL_SCANCODE_A                   a)
   (SDL_SCANCODE_B                   b)
   (SDL_SCANCODE_C                   c)
   (SDL_SCANCODE_D                   d)
   (SDL_SCANCODE_E                   e)
   (SDL_SCANCODE_F                   f)
   (SDL_SCANCODE_G                   g)
   (SDL_SCANCODE_H                   h)
   (SDL_SCANCODE_I                   i)
   (SDL_SCANCODE_J                   j)
   (SDL_SCANCODE_K                   k)
   (SDL_SCANCODE_L                   l)
   (SDL_SCANCODE_M                   m)
   (SDL_SCANCODE_N                   n)
   (SDL_SCANCODE_O                   o)
   (SDL_SCANCODE_P                   p)
   (SDL_SCANCODE_Q                   q)
   (SDL_SCANCODE_R                   r)
   (SDL_SCANCODE_S                   s)
   (SDL_SCANCODE_T                   t)
   (SDL_SCANCODE_U                   u)
   (SDL_SCANCODE_V                   v)
   (SDL_SCANCODE_W                   w)
   (SDL_SCANCODE_X                   x)
   (SDL_SCANCODE_Y                   y)
   (SDL_SCANCODE_Z                   z)

   (SDL_SCANCODE_1                   n-1)
   (SDL_SCANCODE_2                   n-2)
   (SDL_SCANCODE_3                   n-3)
   (SDL_SCANCODE_4                   n-4)
   (SDL_SCANCODE_5                   n-5)
   (SDL_SCANCODE_6                   n-6)
   (SDL_SCANCODE_7                   n-7)
   (SDL_SCANCODE_8                   n-8)
   (SDL_SCANCODE_9                   n-9)
   (SDL_SCANCODE_0                   n-0)

   (SDL_SCANCODE_RETURN              return)
   (SDL_SCANCODE_ESCAPE              escape)
   (SDL_SCANCODE_BACKSPACE           backspace)
   (SDL_SCANCODE_TAB                 tab)
   (SDL_SCANCODE_SPACE               space)

   (SDL_SCANCODE_MINUS               minus)
   (SDL_SCANCODE_EQUALS              equals)
   (SDL_SCANCODE_LEFTBRACKET         left-bracket)
   (SDL_SCANCODE_RIGHTBRACKET        right-bracket)
   (SDL_SCANCODE_BACKSLASH           backslash)
   (SDL_SCANCODE_NONUSHASH           non-us-hash)
   (SDL_SCANCODE_SEMICOLON           semicolon)
   (SDL_SCANCODE_APOSTROPHE          apostrophe)
   (SDL_SCANCODE_GRAVE               grave)
   (SDL_SCANCODE_COMMA               comma)
   (SDL_SCANCODE_PERIOD              period)
   (SDL_SCANCODE_SLASH               slash)

   (SDL_SCANCODE_CAPSLOCK            caps-lock)

   (SDL_SCANCODE_F1                  f1)
   (SDL_SCANCODE_F2                  f2)
   (SDL_SCANCODE_F3                  f3)
   (SDL_SCANCODE_F4                  f4)
   (SDL_SCANCODE_F5                  f5)
   (SDL_SCANCODE_F6                  f6)
   (SDL_SCANCODE_F7                  f7)
   (SDL_SCANCODE_F8                  f8)
   (SDL_SCANCODE_F9                  f9)
   (SDL_SCANCODE_F10                 f10)
   (SDL_SCANCODE_F11                 f11)
   (SDL_SCANCODE_F12                 f12)

   (SDL_SCANCODE_PRINTSCREEN         print-screen)
   (SDL_SCANCODE_SCROLLLOCK          scroll-lock)
   (SDL_SCANCODE_PAUSE               pause)
   (SDL_SCANCODE_INSERT              insert)
   (SDL_SCANCODE_HOME                home)
   (SDL_SCANCODE_PAGEUP              page-up)
   (SDL_SCANCODE_DELETE              delete)
   (SDL_SCANCODE_END                 end)
   (SDL_SCANCODE_PAGEDOWN            page-down)
   (SDL_SCANCODE_RIGHT               right)
   (SDL_SCANCODE_LEFT                left)
   (SDL_SCANCODE_DOWN                down)
   (SDL_SCANCODE_UP                  up)

   (SDL_SCANCODE_NUMLOCKCLEAR        num-lock-clear)
   (SDL_SCANCODE_KP_DIVIDE           kp-divide)
   (SDL_SCANCODE_KP_MULTIPLY         kp-multiply)
   (SDL_SCANCODE_KP_MINUS            kp-minus)
   (SDL_SCANCODE_KP_PLUS             kp-plus)
   (SDL_SCANCODE_KP_ENTER            kp-enter)
   (SDL_SCANCODE_KP_1                kp-1)
   (SDL_SCANCODE_KP_2                kp-2)
   (SDL_SCANCODE_KP_3                kp-3)
   (SDL_SCANCODE_KP_4                kp-4)
   (SDL_SCANCODE_KP_5                kp-5)
   (SDL_SCANCODE_KP_6                kp-6)
   (SDL_SCANCODE_KP_7                kp-7)
   (SDL_SCANCODE_KP_8                kp-8)
   (SDL_SCANCODE_KP_9                kp-9)
   (SDL_SCANCODE_KP_0                kp-0)
   (SDL_SCANCODE_KP_PERIOD           kp-period)

   (SDL_SCANCODE_NONUSBACKSLASH      non-us-backslash)
   (SDL_SCANCODE_APPLICATION         application)
   (SDL_SCANCODE_POWER               power)
   (SDL_SCANCODE_KP_EQUALS           kp-equals)
   (SDL_SCANCODE_F13                 f13)
   (SDL_SCANCODE_F14                 f14)
   (SDL_SCANCODE_F15                 f15)
   (SDL_SCANCODE_F16                 f16)
   (SDL_SCANCODE_F17                 f17)
   (SDL_SCANCODE_F18                 f18)
   (SDL_SCANCODE_F19                 f19)
   (SDL_SCANCODE_F20                 f20)
   (SDL_SCANCODE_F21                 f21)
   (SDL_SCANCODE_F22                 f22)
   (SDL_SCANCODE_F23                 f23)
   (SDL_SCANCODE_F24                 f24)
   (SDL_SCANCODE_EXECUTE             execute)
   (SDL_SCANCODE_HELP                help)
   (SDL_SCANCODE_MENU                menu)
   (SDL_SCANCODE_SELECT              select)
   (SDL_SCANCODE_STOP                stop)
   (SDL_SCANCODE_AGAIN               again)
   (SDL_SCANCODE_UNDO                undo)
   (SDL_SCANCODE_CUT                 cut)
   (SDL_SCANCODE_COPY                copy)
   (SDL_SCANCODE_PASTE               paste)
   (SDL_SCANCODE_FIND                find)
   (SDL_SCANCODE_MUTE                mute)
   (SDL_SCANCODE_VOLUMEUP            volume-up)
   (SDL_SCANCODE_VOLUMEDOWN          volume-down)
   (SDL_SCANCODE_KP_COMMA            kp-comma)
   (SDL_SCANCODE_KP_EQUALSAS400      kp-equals-as400)

   (SDL_SCANCODE_INTERNATIONAL1      international1)
   (SDL_SCANCODE_INTERNATIONAL2      international2)
   (SDL_SCANCODE_INTERNATIONAL3      international3)
   (SDL_SCANCODE_INTERNATIONAL4      international4)
   (SDL_SCANCODE_INTERNATIONAL5      international5)
   (SDL_SCANCODE_INTERNATIONAL6      international6)
   (SDL_SCANCODE_INTERNATIONAL7      international7)
   (SDL_SCANCODE_INTERNATIONAL8      international8)
   (SDL_SCANCODE_INTERNATIONAL9      international9)
   (SDL_SCANCODE_LANG1               lang1)
   (SDL_SCANCODE_LANG2               lang2)
   (SDL_SCANCODE_LANG3               lang3)
   (SDL_SCANCODE_LANG4               lang4)
   (SDL_SCANCODE_LANG5               lang5)
   (SDL_SCANCODE_LANG6               lang6)
   (SDL_SCANCODE_LANG7               lang7)
   (SDL_SCANCODE_LANG8               lang8)
   (SDL_SCANCODE_LANG9               lang9)

   (SDL_SCANCODE_ALTERASE            alt-erase)
   (SDL_SCANCODE_SYSREQ              sys-req)
   (SDL_SCANCODE_CANCEL              cancel)
   (SDL_SCANCODE_CLEAR               clear)
   (SDL_SCANCODE_PRIOR               prior)
   (SDL_SCANCODE_RETURN2             return2)
   (SDL_SCANCODE_SEPARATOR           separator)
   (SDL_SCANCODE_OUT                 out)
   (SDL_SCANCODE_OPER                oper)
   (SDL_SCANCODE_CLEARAGAIN          clear-again)
   (SDL_SCANCODE_CRSEL               crsel)
   (SDL_SCANCODE_EXSEL               exsel)

   (SDL_SCANCODE_KP_00               kp-00)
   (SDL_SCANCODE_KP_000              kp-000)
   (SDL_SCANCODE_THOUSANDSSEPARATOR  thousands-separator)
   (SDL_SCANCODE_DECIMALSEPARATOR    decimal-separator)
   (SDL_SCANCODE_CURRENCYUNIT        currency-unit)
   (SDL_SCANCODE_CURRENCYSUBUNIT     currency-subunit)
   (SDL_SCANCODE_KP_LEFTPAREN        kp-left-paren)
   (SDL_SCANCODE_KP_RIGHTPAREN       kp-right-paren)
   (SDL_SCANCODE_KP_LEFTBRACE        kp-left-brace)
   (SDL_SCANCODE_KP_RIGHTBRACE       kp-right-brace)
   (SDL_SCANCODE_KP_TAB              kp-tab)
   (SDL_SCANCODE_KP_BACKSPACE        kp-backspace)
   (SDL_SCANCODE_KP_A                kp-a)
   (SDL_SCANCODE_KP_B                kp-b)
   (SDL_SCANCODE_KP_C                kp-c)
   (SDL_SCANCODE_KP_D                kp-d)
   (SDL_SCANCODE_KP_E                kp-e)
   (SDL_SCANCODE_KP_F                kp-f)
   (SDL_SCANCODE_KP_XOR              kp-xor)
   (SDL_SCANCODE_KP_POWER            kp-power)
   (SDL_SCANCODE_KP_PERCENT          kp-percent)
   (SDL_SCANCODE_KP_LESS             kp-less)
   (SDL_SCANCODE_KP_GREATER          kp-greater)
   (SDL_SCANCODE_KP_AMPERSAND        kp-ampersand)
   (SDL_SCANCODE_KP_DBLAMPERSAND     kp-dbl-ampersand)
   (SDL_SCANCODE_KP_VERTICALBAR      kp-vertical-bar)
   (SDL_SCANCODE_KP_DBLVERTICALBAR   kp-dbl-vertical-bar)
   (SDL_SCANCODE_KP_COLON            kp-colon)
   (SDL_SCANCODE_KP_HASH             kp-hash)
   (SDL_SCANCODE_KP_SPACE            kp-space)
   (SDL_SCANCODE_KP_AT               kp-at)
   (SDL_SCANCODE_KP_EXCLAM           kp-exclam)
   (SDL_SCANCODE_KP_MEMSTORE         kp-mem-store)
   (SDL_SCANCODE_KP_MEMRECALL        kp-mem-recall)
   (SDL_SCANCODE_KP_MEMCLEAR         kp-mem-clear)
   (SDL_SCANCODE_KP_MEMADD           kp-mem-add)
   (SDL_SCANCODE_KP_MEMSUBTRACT      kp-mem-subtract)
   (SDL_SCANCODE_KP_MEMMULTIPLY      kp-mem-multiply)
   (SDL_SCANCODE_KP_MEMDIVIDE        kp-mem-divide)
   (SDL_SCANCODE_KP_PLUSMINUS        kp-plus-minus)
   (SDL_SCANCODE_KP_CLEAR            kp-clear)
   (SDL_SCANCODE_KP_CLEARENTRY       kp-clear-entry)
   (SDL_SCANCODE_KP_BINARY           kp-binary)
   (SDL_SCANCODE_KP_OCTAL            kp-octal)
   (SDL_SCANCODE_KP_DECIMAL          kp-decimal)
   (SDL_SCANCODE_KP_HEXADECIMAL      kp-hexadecimal)

   (SDL_SCANCODE_LCTRL               lctrl)
   (SDL_SCANCODE_LSHIFT              lshift)
   (SDL_SCANCODE_LALT                lalt)
   (SDL_SCANCODE_LGUI                lgui)
   (SDL_SCANCODE_RCTRL               rctrl)
   (SDL_SCANCODE_RSHIFT              rshift)
   (SDL_SCANCODE_RALT                ralt)
   (SDL_SCANCODE_RGUI                rgui)

   (SDL_SCANCODE_MODE                mode)

   (SDL_SCANCODE_AUDIONEXT           audio-next)
   (SDL_SCANCODE_AUDIOPREV           audio-prev)
   (SDL_SCANCODE_AUDIOSTOP           audio-stop)
   (SDL_SCANCODE_AUDIOPLAY           audio-play)
   (SDL_SCANCODE_AUDIOMUTE           audio-mute)
   (SDL_SCANCODE_MEDIASELECT         media-select)
   (SDL_SCANCODE_WWW                 www)
   (SDL_SCANCODE_MAIL                mail)
   (SDL_SCANCODE_CALCULATOR          calculator)
   (SDL_SCANCODE_COMPUTER            computer)
   (SDL_SCANCODE_AC_SEARCH           ac-search)
   (SDL_SCANCODE_AC_HOME             ac-home)
   (SDL_SCANCODE_AC_BACK             ac-back)
   (SDL_SCANCODE_AC_FORWARD          ac-forward)
   (SDL_SCANCODE_AC_STOP             ac-stop)
   (SDL_SCANCODE_AC_REFRESH          ac-refresh)
   (SDL_SCANCODE_AC_BOOKMARKS        ac-bookmarks)

   (SDL_SCANCODE_BRIGHTNESSDOWN      brightness-down)
   (SDL_SCANCODE_BRIGHTNESSUP        brightness-up)
   (SDL_SCANCODE_DISPLAYSWITCH       display-switch)
   (SDL_SCANCODE_KBDILLUMTOGGLE      kbd-illum-toggle)
   (SDL_SCANCODE_KBDILLUMDOWN        kbd-illum-down)
   (SDL_SCANCODE_KBDILLUMUP          kbd-illum-up)
   (SDL_SCANCODE_EJECT               eject)
   (SDL_SCANCODE_SLEEP               sleep)

   (SDL_SCANCODE_APP1                app1)
   (SDL_SCANCODE_APP2                app2)))
