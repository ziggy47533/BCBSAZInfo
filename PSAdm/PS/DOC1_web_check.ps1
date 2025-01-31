cls# script locationa: G:\OPS\Documentation\2_OperationsShiftTasks\2_SecondShift\Powershell\DOC1_web_check.ps1# on MM-OPS-A01: D:\Scripts\Doc1_Web_Check\DOC1_web_check.ps1## Note: http://wahlnetwork.com/2015/02/19/using-try-catch-powershells-invoke-webrequest/## Pinging the device is no good, because a positive ping doesn’t mean I can complete and API call. So I was looking for a way to do the API call over and over, until I got a code 200, and ignoring all the failures
#http://mp-si0-a06.corp.net.bcbsaz.com/esolutions
#http://mp-si0-a07.corp.net.bcbsaz.com/esolutions$Bdate=get-date -Format G
write-host "Started - $Bdate" -ForegroundColor Yellow## Productionecho "`n`n"write-host "------------------------------ Web Link Check for Production DOC1 Environment ------------------------------" -ForegroundColor Cyan$Hash1=[ordered]@{"http://billing.azblue.com/clientweb/HttpPublic?url=public/getUserIdentification"="eaz-msvc1" ;
                  "http://204.153.155.89/clientweb/HttpPublic?url=public/getUserIdentification"="eaz-msvc1" ;
       
                   ## ach/rmt
                  "http://d1pp.doc1.bcbsaz.com:8912/clientweb/HttpPublic?url=public/getUserIdentification"="D1PP" ;
                  "http://172.18.0.15:8912/clientweb/HttpPublic?url=public/getUserIdentification"="D1PP" ;
       
                  "http://d1pp2.doc1.bcbsaz.com:8912/clientweb/HttpPublic?url=public/getUserIdentification"="D1PP2" ;
                  "http://172.18.0.17:8912/clientweb/HttpPublic?url=public/getUserIdentification"="D1PP2" ; }

foreach ($Website1 in $Hash1.Keys)
{
  try
   {
     $url1=Invoke-WebRequest -Uri $Website1
     
     echo ""
     write-host "$Website1 - $($Hash1[$Website1]) All Good!" -ForegroundColor green
     write-Host “  StatusCode:” $url1.StatusCode -fore Green
     Write-Host “  StatusDescription:” $url1.StatusDescription -fore Green
     echo ""
   }  
  catch
   {
     echo ""
     write-host "Error!" $Website1 "- Investigate!" $($Hash1[$Website1] ) -ForegroundColor Red
     write-host "       -Check spelling on web link" -ForegroundColor Red
     write-host "       -Run check at another Operator's desk" -ForegroundColor Red
     echo ""
     
   }
}
## Model Officeecho "`n`n"write-host "----------------------------- Web Link Check for Model Office DOC1 Environment -----------------------------" -ForegroundColor Cyan$Hash2=[ordered]@{"http://modoff.billing.azblue.com/clientweb/"="baz-mpa06" ;
                 "http://204.153.155.120/clientweb/"="baz-mpa06" ;

                 "http://d1mod.doc1.bcbsaz.com:8912/clientweb/HttpPublic?url=public/getUserIdentification"="d1mod" ;
                 "http://172.18.0.30:8912/clientweb/HttpPublic?url=public/getUserIdentification"="d1mod" ;

                 "http://d1mod2.doc1.bcbsaz.com:8912/clientweb/HttpPublic?url=public/getUserIdentification"="d1mod2" ;
                 "http://172.18.0.31:8912/clientweb/HttpPublic?url=public/getUserIdentification"="d1mod2" ;
                }

foreach ($Website2 in $Hash2.Keys)
{
  try
   {
     $url2=Invoke-WebRequest -Uri $Website2
     
     echo ""
     write-host "$Website2 - $($Hash2[$Website2]) All Good!" -ForegroundColor green
     write-Host “  StatusCode:” $url2.StatusCode -fore Green
     Write-Host “  StatusDescription:” $url2.StatusDescription -fore Green
     echo ""
   }  
  catch
   {
     echo ""
     write-host "Error!" $Website2 "- Investigate!" $($Hash2[$Website2] ) -ForegroundColor Red
     write-host "       -Check spelling on web link" -ForegroundColor Red
     write-host "       -Run check at another Operator's desk" -ForegroundColor Red
     echo ""
     
   }
}

## Productionecho "`n`n"write-host "------------------------- Web Link Check for Assocation Environment -------------------------" -ForegroundColor Cyan$Hash3=[ordered]@{"https://planconnexion-prodxv.bcbs.com/blue2web"="BlueSquared (Blue2)" ;
                  "https://bcbsareporting.bcbs.com/prodreports/bi/"="Blue Exchange (BX) Reporting" ;                  "https://blueweb.bcbs.com/login/login.asp?TYPE=100663297"="BluesNet - BlueCard (Toni Bickel)" ; }foreach ($Website3 in $Hash3.Keys)
{
  try
   {
     $url3=Invoke-WebRequest -Uri $Website3
     
     echo ""
     write-host "$Website3 - $($Hash3[$Website3]). All Good!" -ForegroundColor green
     write-Host “  StatusCode:” $url3.StatusCode -fore Green
     Write-Host “  StatusDescription:” $url3.StatusDescription -fore Green
     echo ""
   }  
  catch
   {
     echo ""
     write-host "Error!" $Website3 "- Investigate!" $($Hash3[$Website3] ) -ForegroundColor Red
     write-Host “       -StatusCode:” $url3.StatusCode -fore red
     write-host "       -Check spelling on web link" -ForegroundColor Red
     write-host "       -Notify BCBS Association contact number (312)297-5500" -ForegroundColor Red
     echo ""
     
   }
}

echo "`n`n"write-host "------------------------------ Web Link Check for Production AZBlue Internal SiteCore Servers ------------------------------" -ForegroundColor Cyan

## Ignores certificate verification, otherwise error message: Invoke-WebRequest : The underlying connection was closed: Could not establish trust relationship for the SSL/TLS secure channel

add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy


## Weblinks on sitecores servers
$SiteCoreServer=[ordered]@{"https://cms1.prod.azblue.com/"="Mp-scr-fw01n01 (172.17.10.171) " ;
                  "https://cms2.prod.azblue.com/"="Mp-scr-fw01n02 (172.17.10.172) " ;
                  "https://cms3.prod.azblue.com/"="Mp-scr-fw01n03 (172.17.10.173) " ; }

foreach ($SiteCore in $SiteCoreServer.Keys)
{
  try
   {
     $SiteCoreURL=Invoke-WebRequest -Uri $SiteCore
     
     echo ""
     write-host "$SiteCore - $($SiteCoreServer[$SiteCore]) All Good!" -ForegroundColor green
     write-Host “  StatusCode:” $SiteCoreURL.StatusCode -fore Green
     Write-Host “  StatusDescription:” $SiteCoreURL.StatusDescription -fore Green
     echo ""
   }  
  catch
   {
     echo ""
     write-host "Error!" $SiteCore "- Investigate!" $($SiteCoreServer[$SiteCore] ) -ForegroundColor Red
     write-host "       -Check spelling on web link" -ForegroundColor Red
     write-host "       -Run check at another Operator's desk" -ForegroundColor Red
     echo ""
     
   }
}



write-host "`n`n"
$Edate=get-date -Format G
write-host "Ended - $Edate`n" -ForegroundColor Yellow

#$BrokerHASH=[ordered]@{"http://10.1.76.199/Orion/SummaryView.aspx?viewname=Current%20Top%2010%20Lists"="Solarwind" }