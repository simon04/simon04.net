---
layout: post
title: Force Firefox 3.0 to install Extension
published: true
---

Hello,

there are several older add-ons hanging around there which don't support Firefox 3.0 officially. Therefore Firefox quits the installation on 2 reasons:

    ... could not be installed because it is not compatible with Firefox ...
    ... will not be installed because it does not provide secure updates.

To fix these problems add a new boolean value in the [about:config](about:config's) table and set the value to be `false` each.

- [extensions.checkCompatibility](http://kb.mozillazine.org/Extensions.checkCompatibility)
- [extensions.checkUpdateSecurity](http://kb.mozillazine.org/Extensions.checkUpdateSecurity)

Cheers,  
Simon
