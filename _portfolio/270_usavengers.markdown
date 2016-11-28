---
layout: post
title: U.S.Avengers
description: avengers across america
img: /img/posts/usavengers_full.png
tags: cartography, web, design
---
<div class="img_row">
    <img class="col three" src="/img/posts/usavengers_clip.png">
</div>
<hr>  

i heard about the forthcoming U.S.Avengers #1 comic over at [io9](http://io9.gizmodo.com/trying-to-figure-out-the-hero-state-pairings-of-marvels-1789141285?rev=1479501955025&utm_campaign=socialflow_io9_twitter&utm_source=io9_twitter&utm_medium=socialflow) recently. while i'm not much of a comic reader, anytime i hear about geographic areas getting assigned their own avengers im genuinely interested.  

i figured mapping this out would be a good learning experience with the mapbox dataset editor, as well as some click/hover events on the map. the cartography is pretty simple, only using a few layers - including some natural earth bathymetry i still had loaded from the [back to school](http://jonahadkins.com/portfolio/291_purp/) map. the standout feature here is a honest-but-not-great effort at a comic/printed/half-tone type effect. this involved about 4 svgs of varying dot size and color, then layering them as transparent background fills. while they didnt tile quite seamlessly, i liked the effect enough to stick with it.  

<div class="img_row">
    <img class="col three" src="/img/posts/tone_svg.png">
</div>
<hr>

i used image links from their source stored as an attribute in the dataset to show when hovered over the point, along with the name, and location (mostly state capitals). also figured out some css
::before & ::after to give the appearance of comic/thought bubble.

for more on the concept of the covers, and avengers in each state, [check out this](https://news.marvel.com/comics/26753/introducing_usavengers_state_variants/) write up over at marvel's site.



<div class="img_row">
    <img class="col three" src="/img/posts/usavengers_full.png">
</div>
<hr>

special thanks to [sarah](https://github.com/sml2198/JC-buildings/blob/gh-pages/10-19-16.html) & [justin](http://justinmiller.io/posts/2015/01/20/anatomy-of-a-travel-map/) who's previous work & code helped me get through some bumps in the road.  
