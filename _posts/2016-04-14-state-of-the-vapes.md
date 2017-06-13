---
layout: post
title: "Rise of the State of the Vapes"
date: 2016-04-14
categories: [cartography, mapbox, data, cartodb]
---

tl;dr [State of the Vapes](http://jonahadkins.github.io/vapes.html) Map.    

Sometimes you find yourself wondering about odd things. Recently in Hampton Roads, it seems that giant plumes of vapor permeate just about everywhere. Shops dedicated to vape or e-cigs have also seemed to crop up along the main thoroughfares throughout the region. I was curious enough to actually find out if there are as many vape shops across the state, as there are here locally.  

Lets find some data then! Wait...Hold on... It's totally a rabbit hole. It's hard to find all retailers, meaning there's all kinds of 7-11's, sword shops, and unique gift stores that sell vape supplies. You could assume every 7-11 sells them but no way to be sure. Next idea - Virginia business data? One thing that vape shops have in common is the 'punned' use of the word 'vape' in the name. So we can search the business data and at the least isolate 'vape' shops and see what that looks like...  

Ha-ha-ha yeah right. Business data in Virginia costs! **$150 dollars per request!** Good thing I know [Waldo Jaquith](https://twitter.Com/waldojaquith) ran into data-access problems with the state corporation commission awhile back and he actually buys the data and makes it openly searchable and available. He tells the whole [story](https://waldo.Jaquith.Org/blog/2014/06/virginia-corporate-data/) on his site, which is a great read!  

So we get the data on the map and I want to jazz it up a bit... I ran through a couple ideas, like adding the actual cloud cover from NOAA or wherever just haze the map up, and then I messed around with [Torque](https://cartodb.Com/torque/) to create some time series things like:  

![v1]({{ site.url }}/static/projects/vape-1.gif)  

Ultimately I ended up using [Mapbox GL](https://www.Mapbox.Com/developers/), mostly to use the tilt perspective of gl with a vapor-cloud styled heat map effect. And without plugging Mapbox too too much - I really just streamed together several examples like [heatmap](https://www.Mapbox.Com/mapbox-gl-js/example/heatmap/) and a few others.

![v2]({{ site.url }}/static/projects/vape-2.gif)  

*So*, to answer my curiosity, since 2012 vape shops have grown from *2* to *90* -- wow!!!  

Special shot-outs to Gretchen, Albert, and Waldo for their gracious support on this project!
