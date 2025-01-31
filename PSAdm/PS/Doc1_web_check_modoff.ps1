clear-host

$A01_Browser="msedge.exe"

#start-process $A01_Browser "http://modoff.billing.azblue.com/clientweb/"
#start-sleep -Seconds 1
#start-process $A01_Browser "http://204.153.155.120/clientweb/"

#Prod - eaz-msvc1
start-process $A01_Browser "http://billing.azblue.com/clientweb/HttpPublic?url=public/getUserIdentification"
start-process $A01_Browser "http://204.153.155.89/clientweb/HttpPublic?url=public/getUserIdentification"

start-sleep -Seconds 2
#Prod - D1PP
start-process $A01_Browser "http://d1pp.doc1.bcbsaz.com:8912/clientweb/HttpPublic?url=public/getUserIdentification"
start-process $A01_Browser "http://172.18.0.15:8912/clientweb/HttpPublic?url=public/getUserIdentification"

start-sleep -Seconds 2
#Prod - D1PP2
start-process $A01_Browser "http://d1pp2.doc1.bcbsaz.com:8912/clientweb/HttpPublic?url=public/getUserIdentification"
start-process $A01_Browser "http://172.18.0.17:8912/clientweb/HttpPublic?url=public/getUserIdentification"