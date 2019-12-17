(define-resource log-entry ()
  :class (s-prefix "rlog:Entry")
  :properties `((:class-name :url ,(s-prefix "rlog:className"))
                (:message :string ,(s-prefix "rlog:message"))
                (:specific-information :string ,(s-prefix "ext:specificInformation"))
                (:datetime :datetime ,(s-prefix "rlog:date")))
  :has-one `((log-level :via ,(s-prefix "rlog:level")
                   :as "log-level")
              (status-code :via ,(s-prefix "rlog:hasCode")
                   :as "status-code")
              (log-source :via ,(s-prefix "dct:source")
                   :as "log-source"))
  :resource-base (s-url "http://data.lblod.info/id/log-entries/")
  :features `(include-uri)
  :on-path "log-entries")

(define-resource log-level ()
  :class (s-prefix "rlog:Level")
  :properties `((:priority :number ,(s-prefix "rlog:priority"))
                (:label :string ,(s-prefix "skos:prefLabel")))
  :resource-base (s-url "http://data.lblod.info/id/log-levels/")
  :features `(include-uri)
  :on-path "log-levels")

(define-resource status-code ()
  :class (s-prefix "rlog:StatusCode")
  :properties `((:code :number ,(s-prefix "rlog:codeId")))
  :resource-base (s-url "http://data.lblod.info/id/status-codes/")
  :features `(include-uri)
  :on-path "status-codes")

(define-resource log-source ()
  :class (s-prefix "ext:LogSource")
  :properties `((:label :string ,(s-prefix "skos:prefLabel")))
  :resource-base (s-url "http://data.lblod.info/id/log-sources/")
  :features `(include-uri)
  :on-path "log-sources")

(define-resource log-report ()
  :class (s-prefix "ext:LogReport")
  :properties `((:creation-date :datetime ,(s-prefix "dct:created"))
                (:author :string ,(s-prefix "dct:creator")))
  :has-one `((report-content :via ,(s-prefix "ext:reportContent") :as "report-content"))
  :resource-base (s-url "http://data.lblod.info/id/log-reports/")
  :features `(include-uri)
  :on-path "log-reports")


(define-resource report-content ()
  :class (s-prefix "ext:ReportContent")
  :has-many `((aggregate :via ,(s-prefix "ext:aggregates") :as "aggregate")
              (log-entry :via ,(s-prefix "ext:entries") :as "log-entry"))
  :resource-base (s-url "http://data.lblod.info/id/report-contents/")
  :features `(include-uri)
  :on-path "report-contents")

(define-resource aggregate ()
  :class (s-prefix "ext:Aggregate")
  :properties `((:count :number ,(s-prefix "ext:logCount"))
                (:type :string ,(s-prefix "skos:prefLabel"))
  )
  :has-many `((log-entry :via ,(s-prefix "ext:entries") :as "log-entry"))
  :resource-base (s-url "http://data.lblod.info/id/aggregates/")
  :features `(include-uri)
  :on-path "aggregates")

(define-resource period ()
  :class (s-prefix "gleif:Period")
  :properties `((:start :datetime ,(s-prefix "gleif:hasStart"))
                (:end :datetime ,(s-prefix "gleif:hasEnd")))
  :resource-base (s-url "http://data.lblod.info/id/periods/")
  :features `(include-uri)
  :on-path "periods")
