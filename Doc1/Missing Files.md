% Missing Files
% Brandon Potter
% 03/18/17

# Missing ACH and/or REMIT Files

At 14:00 and 16:30 everyday, an ACH and REMIT file is created and sent to HPE.

## Involved Servers

- D1PP
- BCBSAIX1
- MP-ABS-SA0*

## Alerts

At either 14:00 or 16:30, you may see an email alert with the subject:
_!! PRODUCTION ACH File not found_ or _!! PRODUCTION REMIT File not found_. This
means the scheduled tasks on D1PP failed and need to be re-queued. See [ACH][ACH]
and [REMIT][REMIT] for screenshots.

## Steps

1. Login to D1PP with either vSphere or RDP.
    - If you use RDP, be sure to set the domain as *DOC1*.
    - D1PP is located in FlexPod 7.
1. Stop JBOSS. On the Desktop is a shortcut, _Stop JBoss Services_.
1. Start JBoss. Shortcut on Desktop, _Start JBoss Services_.
1. From your computer, go to
  [http://d1pp.doc1.bcbsaz.com:8912/clientweb](http://d1pp.doc1.bcbsaz.com:8912/clientweb).
1. Login with appropriate account based on environment.
  Username is _operations_, password is located in _G:\\Ops\\Shifts\\Logins.xlsx_.
1. Start all the internal agents.
    1. Under **Operations** on the sidebar, click **Available Agents**.
    1. Click **Start All Available Agents** at the bottom.
1. Resubmit the task.
    1. Under **Operations** on the sidebar, click **Scheduled Tasks**.
    1. Click **Add Task**.
    1. Click **SchedInLT** for **BCBSAZ_ACH_DELIVERY_SET**.
    1. Fill in the details using the table below.
    1. Watch the job for the next 30-40 minutes to ensure it suceeds.

Field                          Value
---------------------------    -----------------------
Name                           ACH Scheduled Task
Scheduled Date                 Same day, 1 minute later
Payment Type                   Bank_Debit
Delivery Output Folder         D:\\e2\\bcbsaz_data\\payment
Delivery Format XML Path       D:/e2/format_xml/ACH_Payment_Delivery.xml
Remittance Output Folder       D:\\e2\\bcbsaz_data\\payment
Remittance Format XMLPath      D:/e2/format_xml/ACH_Payment_Remittance.xml
Subscriber Output Folder       D:\\e2\\bcbsaz_data\\payment
Subscriber Format XMLPath      D:/e2/format_xml/ACH_Payment_Subscriber.xml
--------------------------     ----------------------------

: Details for job.

## Figures

[REMIT]: REMIT missing.png
[ACH]: ACH missing.png

![Missing REMIT email.][REMIT]

![Missing ACH email.][ACH]
