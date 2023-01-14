---
layout: post
title: GitKraken – data kraken – Yet another application that tracks you?
published: true
---

**tl;dr**: GitKraken does not check certificate for `api.gitkraken.com`, and submits an ID plus some usage statistics on every start.

<hr>
Today, I was excited to try the just released [GitKraken](https://blog.axosoft.com/2016/03/29/axosoft-gitkraken-v1/). After installing the [AUR package](https://aur.archlinux.org/packages/gitkraken/) (1.0.0-1) and launching the application, I was immediately asked to register. I entered some nonsense email and name and followed the tour.

GitKraken soon listed all my Git repository on my computer which is a cool feature. But I also got a bit suspicious: it could easily aggregate the repository names, submit it and link it to the registered user.

I decided to investigate the network traffic using [mitmproxy](https://mitmproxy.org/). The challenge was to obtain the GitKraken traffic. Since I could not find a proxy configuration within GitKraken. I followed [this tutorial](https://www.darkcoding.net/software/decrypt-your-https-traffic-with-mitmproxy/) to configure mitmproxy in the "Transparent Proxy" mode. I did not install the CA, though.

## Registering

I registered in the application …
![](/img/2016/04/gitkraken-register-app.png)

… a observed a request to `https://api.gitkraken.com/register`:
[![](/img/2016/04/gitkraken-register-net1.png)](/img/2016/04/gitkraken-register-net1.png)

The server generates an `id` which is used for subsequent requests:
[![](/img/2016/04/gitkraken-register-net2.png)](/img/2016/04/gitkraken-register-net2.png)

But, wait! Mitmproxy intercepts the HTTPS traffic and encrypts it again using its own certificate, which I did not trust. This is what Chromium showed while my traffic was going through mitmproxy:
![](/img/2016/04/mitmproxy-chrome.png)

This means that **GitKraken does accept any certificate for api.gitkraken.com**!

## Confirmation

I clicked on the confirmation link sent via email (`https://api.gitkraken.com/activate/d810cfe7-c828-47af-860f-9e71cbd68ded/0746…`, note the `id` from above). The application makes a request to `https://api.gitkraken.com/phone-home` to check the registration status:
[![](/img/2016/04/gitkraken-registercheck-net1.png)](/img/2016/04/gitkraken-registercheck-net1.png)
[![](/img/2016/04/gitkraken-registercheck-net2.png)](/img/2016/04/gitkraken-registercheck-net2.png)

## Application start

After every start of the application, `https://api.gitkraken.com/phone-home` is requested again. Besides re-checking the activation status this aims at submitting usage/timing statistics, of course together with the `id`:
[![](/img/2016/04/gitkraken-appstart-net1.png)](/img/2016/04/gitkraken-appstart-net1.png)
[![](/img/2016/04/gitkraken-appstart-net2.png)](/img/2016/04/gitkraken-appstart-net2.png)

## Summary

You can man-in-the-middle `api.gitkraken.com` and obtain usage/timing statistics every time the user opens GitKraken.
