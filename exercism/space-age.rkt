#lang racket

(provide on-mercury
         on-venus
         on-earth
         on-mars
         on-jupiter
         on-saturn
         on-uranus
         on-neptune)

(define (on-mercury seconds)
  (let ((earth-years (on-earth seconds)))
    (/ earth-years 0.2408467)))


(define (on-venus seconds)
  (let ((earth-years (on-earth seconds)))
    (/ earth-years 0.61519726)))


(define (on-earth seconds)
  (/ seconds 31557600.0))


(define (on-mars seconds)
  (let ((earth-years (on-earth seconds)))
    (/ earth-years 1.8808158)))


(define (on-jupiter seconds)
  (let ((earth-years (on-earth seconds)))
    (/ earth-years 11.862615)))


(define (on-saturn seconds)
  (let ((earth-years (on-earth seconds)))
    (/ earth-years 29.447498)))


(define (on-uranus seconds)
  (let ((earth-years (on-earth seconds)))
    (/ earth-years 84.016846)))


(define (on-neptune seconds)
  (let ((earth-years (on-earth seconds)))
    (/ earth-years 164.79132)))
