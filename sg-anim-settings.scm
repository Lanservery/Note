; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

(define (script-fu-sg-anim-settings image drawable req-delay req-mode)
  (define (get-visibles image)
    (let loop ((layers (vector->list (cadr (gimp-image-get-layers image))))
               (visibles '()) )
      (if (null? layers)
        (if (null? visibles)
          visibles             ; 'reverse' can't handle NIL
          (reverse visibles) ) ; retain top-to-bottom order
        (loop (cdr layers)
              (if (zero? (car (gimp-drawable-get-visible (car layers))))
                visibles
                (cons (car layers) visibles) )))))
  (gimp-image-undo-group-start image)
  (let ((layers (get-visibles image)))
    (if (zero? (length layers))
      (gimp-message "Need at least one visible layer")
      (while (pair? layers)
        (let* ((full-name (strbreakup (car (gimp-drawable-get-name (car layers))) "("))
               (layer-name (car full-name))
               (par-name "")
               (mode "")
               (delay "") )
          (cond
            ((or (= req-mode 0) (= req-mode 3))
              (set! mode "") )
            ((= req-mode 1)
              (set! mode " (combine)") )
            ((= req-mode 2)
              (set! mode " (replace)") ))
          (set! full-name (cdr full-name))
          (while (pair? full-name) ;; for each parenthetical, see if it is a delay or a mode
            (let ((option (string-trim (car (strbreakup (car full-name) ")")))))
              (cond
                ((string-ci=? option "combine")
                  (if (= req-mode 0) ;; Keep
                    (set! mode " (combine)") ))
                ((string-ci=? option "replace")
                  (if (= req-mode 0) ;; Keep
                    (set! mode " (replace)") ))
                ((char-numeric? (string-ref option 0))
                  (if (= req-delay 0)
                    (set! delay (string-append "(" option ")"))
                    (set! delay "") )));; clear delay for -1 or for positive request
              (set! full-name (cdr full-name)) ))
          (if (> req-delay 0)
            (set! delay (string-append "(" (number->string req-delay) "ms)")) )
          (gimp-drawable-set-name (car layers) (string-append layer-name delay mode))
          (set! layers (cdr layers))
          )
        )
      )
    )
  (gimp-image-undo-group-end image)
  (gimp-displays-flush)
  )

(script-fu-register "script-fu-sg-anim-settings"
 "_Settings..." ;; might like to keep it separate from the standard plugins
 "Set the Frame delay and mode of GIF animations by renaming visible layers."
 "Saul Goode"
 "Saul Goode"
 "3/11/2006"
 "*"
 SF-IMAGE    "Image"    0
 SF-DRAWABLE "Drawable" 0
 SF-ADJUSTMENT "Delay: (1-10000 mS, 0=Keep, -1=Clear)" '( 100 -1 10000 1 10 0 1 )
 SF-OPTION "Mode:" '( "Keep" "(combine)" "(replace)" "Clear")
 )
(script-fu-menu-register "script-fu-sg-anim-settings"
  "<Image>/Filters/Animation"
  )
