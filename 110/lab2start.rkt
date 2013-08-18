;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab2start) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Count is one of:
;; - false
;; - Natural[1, 10]
;; interp. false means countdown is over, Natural is number of seconds before midnight

(define C1 10)
(define C2 1)
(define C3 false)

(define (fn-for-ct c)
  (cond [(false? c) (...)]
        [(number? c) (... c)]))

; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: false
;; - atomic non-distinct: Natural[1, 10]