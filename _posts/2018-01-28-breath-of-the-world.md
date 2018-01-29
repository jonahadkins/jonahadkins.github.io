---
layout: post
title:  "Breath of the World"
date:   2018-01-28
categories: [cartography, esri]
---

.  

tl;dr  [Breath of the World map!](http://jonahadkins.com/botw.html)

<hr>

![botwweb]({{ site.url }}/static/projects/botw_web.png)

<hr>

[Last week](http://jonahadkins.com/cartography/esri/2018/01/22/breath-of-the-wild.html), I made a Legend of Zelda: Breath of the Wild inspired map of [The Noland Trail](http://jonahadkins.com//static/projects/lynel.jpg). _This week_ I decided to take it a step further, and create a set of vector tiles for the world with ArcGIS Pro.

To make tiles for the world I'd need global data, rather than data from my [Open Noland Trail](http://jonahadkins.com/open-noland-trail/) site. For the vector part I decided to use [Natural Earth Data](http://www.naturalearthdata.com), it's a free global dataset that's designed just for uses like this. In particular, I used:


- Country Labels _(10m_admin_0_countries_lakes)_
- State Labels _(10m_admin_1_states_provinces)_
- Bathymetry _(10m_bathymetry (J,K,L))_
- Ocean Labels _(10m_geography_marine_polys)_
- Graticules _(10m_graticules (1,10))_
- Parks (_10m_parks_and_protected_lands)_
- Roads _(10m_roads)_
- Coastline _(50m_coastline)_
- Lakes _(50m_lakes)_
- Populated Places _(50m_populated_places)_
- Background _(50m_wgs84_bounding_box)_


For land elevation, I looked into [ETOPO 1](https://www.ngdc.noaa.gov/mgg/global/global.html), the one arc-minute global relief model of Earth's surface. Since I cannot integrate the raster into the vector tiles I would need to extract both elevation polygons and contours. I ran some focal statistics on the raster to smooth it out a bit, then created both contour line and polygon outputs. For display, I grouped the polygons into elevations of 0, 100, 200, 300, 400, 500, 1000, 2000, and 3000 and above. I used the same grouping for the contours, but made the group breaks thicker lines and elevations between the breaks thinner ones.

<hr>

Here's an animation of all the layers/groups in ArcGIS Pro before publishing as vector tiles.

![animated]({{ site.url }}/static/projects/botw2.gif)  

<hr>

After creating a tile index for the world, I published the vector tiles up to ArcGIS Online. The first vector tile package (vtpk) I published were 119mb, so I went back and did some dissolves, line simplifications, and generalizations on the data, which resulted in a 39mb publish size the second time. This is where it gets a bit tricky - I'm guessing there's some disconnect between styles and labels in Pro and the vector tile specification. Errors I've noticed mostly have to do with overlapping zoom scales and labels. Label stacking seems to get dropped, I've seen offsets applied when there were none, and a few other smaller issues.  

<hr>

Below you can see a comparison of zoom level 4:

![compare]({{ site.url }}/static/projects/compare_pro.png)

<hr>

The overall published result is not _that bad_ but it could be better. I still need to make changes, which is always part of the cartographers process, but it would be nice to start with what _I think_ I've published. In an [older post](http://jonahadkins.com/cartography/esri/mapbox/2017/06/15/esri-maputnik.html) I talk about editing Esri vector tiles - for this map I decided to use the [Beta Vector Style Editor](https://maps.esri.com/jg/VectorBasemapStyleEditor/) only because I knew the exact edits I would be making and this tool allows me to isolate each zoom level.  

<hr>
Screenshot of the [Beta Vector Style Editor](https://maps.esri.com/jg/VectorBasemapStyleEditor/)  
![editvbtpk]({{ site.url }}/static/projects/edit_vtpk.png)

<hr>

You can see all the changes I made in [this commit](https://github.com/jonahadkins/jonahadkins.github.io/commit/f056d25c3513573afa94760bad7718ffdf7b6e27) where I first uploaded the original `json` then updated/commited the edited `json`.

<hr>
Exmaple of adding label properties back into the style.  
![gitedits]({{ site.url }}/static/projects/git_edits.png)

<hr>

Please feel free to [email me](mailto:jonahadkins@gmail.com) or hit me up on [twitter](https://twitter.com/jonahadkins) if you want some more details, copies of my ArcGIS Pro docs, or have any general questions.
