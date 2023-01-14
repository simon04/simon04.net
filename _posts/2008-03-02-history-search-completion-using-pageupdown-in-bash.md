---
layout: post
title: History search Completion using PageUp/Down in Bash
published: true
---

The Bash-shell stores a history of your last commands. Entering `history` will display all recently used commands identifying them by an id which lets you access them by entering `![id]`. This is a nice feature, but unhandy: you can't easily edit the command before being executed and furthermore to find the appropriate id you have to look through the whole list or use `grep`.

Bash offers a feature which could be called **history search auto completion**. Just enter the first letters of the command and use \[PageUp\] and \[PageDown\] to browse through recently used commands matching exactly the part you already entered.

To do so create/edit the file `.inputrc` in your home folder and insert the following two lines. Alternatively you could edit the `/etc/inputrc` which would let the changes effect in global scope.

    "e[5~": history-search-backward
    "e[6~": history-search-forward

Cheers  
Simon
