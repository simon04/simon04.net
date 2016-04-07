---
layout: post
title: ! 'TK202 GPS/GPRS tracker: firmware update'
published: true
---
Today, I successfully updated the firmware of some TK202 GPS/GPRS trackers, labelled *simtrace TK202*, bought in 2009 or so.
[![](/img/2012/07/tk202-300x214.jpg)](/img/2012/07/tk202.jpg)

Here's what I did:

1.  Get a USB cable, I used [this one](http://www.itakka.com/index.php?main_page=product_info&cPath=1&products_id=1)
2.  Install latest [PL-2303 driver from prolificusa.com](http://prolificusa.com/pl-2303hx-drivers/)
3.  Obtain firmware for *TK102 (Ohne SD Kartenslot)* from [yourgps.de](http://www.yourgps.de/content/de/Downloads/Firmwares)
4.  Extract archive
5.  Follow instructions from the enclosed document.

This screenshot summarizes the procedure:
[![](/img/2012/07/stc-isp-annotated-300x226.png)](/img/2012/07/stc-isp-annotated.png)

Afterwards, the GPRS transmission was working nicely. In particular, I was no longer getting a `APN failed!` after sending an `apnuser123456`/`apnpasswd123456` command.

To test the GPRS transmission, you might find [GPS Device Unique ID Checker](http://id.wialon.net/) helpful.
