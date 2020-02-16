(use rfc.http)
(use text.csv)

(define (main args)
  (receive (status header body)
           (http-get "raw.githubusercontent.com" "/pandas-dev/pandas/master/pandas/tests/data/iris.csv")
           (with-output-to-file "iris.csv"
                              (lambda () (display body)))) 0)
