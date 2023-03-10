---
layout: post
title: Move Phone book from Sony Ericsson to Nokia
published: true
---

Today I faced the challenge to move my phone book contacts from a Sony Ericsson K608i to my new Nokia 3110 classic.I didn't want to install the entire Nokia PC Suite on my PC since I use Kubuntu virtually all the time.

I figured a way out which does not require any additional programs than [Mozilla Thunderbird](http://www.mozilla.com/thunderbird/) and bluetooth utilities available in the Ubuntu repositories.

The Sony Ericsson phone offers to send the entire contact list either via bluetooth or via infrared as one vCard containing all numbers. To do so, just go Contacts » Options » Advanced » Send all contacts. Unfortunately this format is not supported by Nokia phones; it's confirmed by a Nokia employee in the [forum](http://discussion.forum.nokia.com/forum/showthread.php?t=30581). I used my Kubuntu bluetooth features to receive exactly this vcf-file.

To import this vCard into Thunderbird and export the contacts afterwords an additional extension is required. Download MoreFunctionsForAddressBook from the developer's [homepage](https://nic-nac-project.org/~kaosmos/morecols-en.html) and set it up (Tools » Add-ons » Install).

After restarting Thunderbird (to install the extension) open the Address Book, add a new, right click in the main field and select Import vCard/vcf. At this point feel free to edit your data and especially bring name and surname in the right format as Sony Ericsson does not distinguish them but Nokia does.

Mark all the entries and right click to Export them as vCard. At this time each entry will be stored in a different file. To get rid of the useless entry how the name should be displayed (_FN;QUOTED-PRINTABLE:_), run the following bash command in the appropriate directory:

`mkdir new; for i in *.vcf; do cat $i| grep -v ^FN > new/$i; done`

At last use KBluetooth to send the files (_Send File_) back to the new Nokia device. I needed to do this stepwise as it didn't work otherwise.

For the future I think of setting up OpenSync to my Nokia phone to sync the contacts as well as my Google Calendar.

Cheers  
Simon
