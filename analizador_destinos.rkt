#lang racket
;; =======================================================
;; Evidencia: Sistema de Recomendación Funcional
;; Paradigma: Funcional (Racket)
;; =======================================================

;; Base de datos inmutable (Lista de listas)
(define destinos
  '((cancun calido alto)
    (paris templado alto)
    (vancouver frio alto)
    (tokio templado medio)
    (bogota calido medio)
    (buenosAires frio medio)
    (islaMujeres calido bajo)
    (yucatan calido bajo)
    (madrid calido bajo)))

;; Función de recomendación usando condiciones y recursion
(define (recomendar clima presupuesto lista)
  (cond
    [(null? lista) '()]
    [else
     (define actual (car lista))
     (define resto (cdr lista))
     
     ;; Verificamos si el destino actual cumple con los requisitos del usuario
     (if (and (equal? (second actual) clima)
              (equal? (third actual) presupuesto))
         ;; Si cumple, lo agregamos al resultado y seguimos revisando el resto
         (cons actual (recomendar clima presupuesto resto))
         ;; Si no cumple, lo ignoramos y seguimos revisando el resto
         (recomendar clima presupuesto resto))]))

