---
layout: post
title: rise of the state of the vapes
date: 2016-04-14
description: learning all the things, again
---

tl;dr [state of the vapes](http://jonahadkins.github.io/vapes.html) map

sometimes you find yourself wondering about odd things. recently in hampton roads, it seems that giant plumes of vapor
permeate just about everywhere. shops dedicated to vape or e-cigs have also seemed to crop up along the main thoroughfares throughout the region. i was curious enough to actually find out if there are as many vape shops across the state, as there are here locally.

lets find some data then! wait...hold on... it's totally a rabbit hole. it's hard to find all retailers, meaning there's all kinds of 7-11's, sword shops, and unique gift stores that sell vape supplies. you could assume every 7-11 sells them but no way to be sure. next idea - virginia business data? one thing that vape shops have in common is the 'punned' use of the word 'vape' in the name. so we can search the business data and at the least isolate 'vape' shops and see what that looks like..

ha-ha-ha yeah right. business data in virginia costs! $150 dollars per request! good thing i know [Waldo Jaquith](https://twitter.com/waldojaquith) ran into data-access problems with the state corporation commission awhile back and he actually buys the data and makes it openly searchable and available. he tells the whole [story](https://waldo.jaquith.org/blog/2014/06/virginia-corporate-data/) on his site, which is a great read!

so we get the data on the map and i want to jazz it up a bit... a ran through a couple ideas, like adding the actual
cloud cover from NOAA or wherever just haze the map up, and then i messed around with [torque](https://cartodb.com/torque/) to create some time series things like:

<div class="img_row">
    <img class="col three" src="/img/posts/vape.gif">
</div>

<br>
ultimately i ended up using [Mapbox GL](https://www.mapbox.com/developers/), mostly to use the tilt perspective of GL with a vapor-cloud styled heat map effect. and without plugging Mapbox too too much - i really just streamed together several examples like [heatmap](https://www.mapbox.com/mapbox-gl-js/example/heatmap/) and a few others. 

<div class="img_row">
    <img class="col three" src="/img/posts/vape2.gif">
</div>

*SO* to answer my curiosity, since 2012 vape shops have grown from *2* to *90* -- WOW!!!

<P>special shot-outs to gretchen, albert, and waldo for their gracious support on this project!
