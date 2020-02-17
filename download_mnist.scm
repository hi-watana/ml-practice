(use rfc.http)
(use text.csv)

(define (main args)
  (for-each (lambda (csv-name)
              (receive (status header body)
                       (http-get "pjreddie.com" (string-join (list "/media/files/" csv-name) ""))
                       (with-output-to-file csv-name
                                            (lambda () (display body)))))
            (list "mnist_train.csv" "mnist_test.csv")) 0)
