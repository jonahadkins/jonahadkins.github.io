---
layout: post
title:  "U.S.Avengers"
date:   2016-11-27
categories: [cartography, mapbox]
---

### tl:dr   
Check out [U.S.Avengers](http://jonahadkins.com/usavengers.html).


![usa1]({{ site.url }}/static/projects/usavengers_1.png)  

I heard about the forthcoming U.S.Avengers #1 comic over at [io9](http://io9.Gizmodo.Com/trying-to-figure-out-the-hero-state-pairings-of-marvels-1789141285?Rev=1479501955025&utm_campaign=socialflow_io9_twitter&utm_source=io9_twitter&utm_medium=socialflow) recently. While I'm not much of a comic reader, anytime I hear about geographic areas getting assigned their own avengers I'm genuinely interested.  

I figured mapping this out would be a good learning experience with the mapbox dataset editor, as well as some click/hover events on the map. The cartography is pretty simple, only using a few layers - including some natural earth bathymetry I still had loaded from the back to school map. The standout feature here is an honest-but-not-great effort at a comic/printed/half-tone type effect. This involved about 4 svgs of varying dot size and color, then layering them as transparent background fills. While they didn't tile quite seamlessly, I liked the effect enough to stick with it.  

![usa2]({{ site.url }}/static/projects/usavengers_2.png)

I used image links from their source stored as an attribute in the dataset to show when hovered over the point, along with the name, and location (mostly state capitals). Also figured out some css
::before & ::after to give the appearance of comic/thought bubble.  

![usa3]({{ site.url }}/static/projects/usavengers_3.png)


For more on the concept of the covers, and avengers in each state, [check out this](https://news.Marvel.Com/comics/26753/introducing_usavengers_state_variants/) write up over at marvel's site.  

*Special thanks to [Sarah](https://github.Com/sml2198/jc-buildings/blob/gh-pages/10-19-16.Html) & [Justin](http://justinmiller.Io/posts/2015/01/20/anatomy-of-a-travel-map/) who's previous work & code helped me get through some bumps in the road.*
