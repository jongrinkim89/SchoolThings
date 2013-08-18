;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname graded4tryagain) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)

;; When the mouse is clicked anywhere on the screen, a coundown from 10-0 begins at that position; the countdown also scrolls down the screen, stopping count and scroll at 0.


;; Constants:

(define HEIGHT 600)
(define WIDTH 600)

(define Y-SPACING -20)
(define MTS (empty-scene WIDTH HEIGHT))

(define TEXT-SIZE 20) 
(define TEXT-COLOR "black")


;; Data Definitions:

(define-struct countdown (x y i))
;; Countdown is (make-countdown Integer(0, HEIGHT) Integer(0, WIDTH) Number[0, 10]
;; interp. (make-countdown x y i) is a state of the countdown at x and y positions, and at an integer[0, 10]


(define C1 (make-countdown 200 200 10))
(define C2 (make-countdown WIDTH 200 1))
(define C3 (make-countdown 200 HEIGHT 0))

#;
(define (fn-for-countdown c)
  (... (countdown-x c)
       (countdown-y c)
       (countdown-i c)))


;; Functions:

;; Countdown -> Countdown
;; run the program starting with a make-countdown I've defined
(define (start x)
  (big-bang (make-countdown x 200 10)
            (on-mouse mouse-button)
            (on-tick next-count 1)
            (to-draw render)))


;; Countdown -> Countdown
;; produce the next countdown

(check-expect (next-count (make-countdown 500 400 10)) (make-countdown 500 420 9))

(define (next-count c)
  (if (> (countdown-i c) 0)
  (make-countdown 
   (countdown-x c)
   (- (countdown-y c) Y-SPACING)
   (sub1 (countdown-i c)))
  c))


;; Countdown -> Image
;; 
(check-expect (render (make-countdown 500 400 10)) (place-image (text "10" TEXT-SIZE TEXT-COLOR)
                                                            500
                                                            400
                                                            MTS))

(define (render c)
  (place-image (text (number->string (countdown-i c)) TEXT-SIZE TEXT-COLOR)
               (countdown-x c)
               (countdown-y c)
               MTS))


;; MouseEvent -> Countdown
;
(check-expect (handle-mouse empty 3 12 "button-down")
              (cons (make-drop 3 12) empty))

(define (mouse-button c x y me)                      ;; Template from HtDW page
  (cond [(mouse=? me "button-down") (make-countdown x y 10)]
        [else c]))



(start -600)