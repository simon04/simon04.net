---
layout: post
title: Lightweight Google Calendar for Drupal
published: true
---
Today, I needed to integrate a lightweight and configurable calendar in a Drupal 6 page. The calendar entries should be obtained from a (public) Google calendar automatically. I ended up with the Drupal modules [gcal\_events](https://drupal.org/project/gcal_events) and [insert\_block](https://drupal.org/project/insert_block). Here's what I did:

1.  Download the two modules, apply the patch from [373071](https://drupal.org/node/373071) in order to obtain localized month names, obtained the needed [simplepie.inc](http://dev.simplepie.org/SimplePie.compiled.php) (to go into `/modules/gcal_events/simplepie.inc`)
2.  Upload to webserver (as well as create a writeable directory `/module/gcal_events/cache`)
3.  Enable the modules in `/admin/build/modules`
4.  Edit calendar block as needed: `/admin/build/block/configure/gcal_events/0`
5.  Add *insert block filter* to a filter of choice (`/admin/settings/filters`)
6.  Create a page `/node/add/page`, insert `[block:gcal_events=0]` as content (select filter from previous step)
7.  When using caching, exclude page from previous step using module [cacheexclude](https://drupal.org/project/cacheexclude) (`/admin/settings/cacheexclude`)
8.  Done :-)

The result is currently visible as a demo page under <http://martinmallaun.com/kalender>.
