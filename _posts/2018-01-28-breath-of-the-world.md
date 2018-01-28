---
layout: post
title:  "Breath of the World"
date:   2018-01-28
categories: [cartography, esri]
---

tl;dr [Breath of the World map!](http://jonahadkins.com/botw.html)

[Last week](http://jonahadkins.com/cartography/esri/2018/01/22/breath-of-the-wild.html), I made a Legend of Zelda: Breath of the Wild inspired map of [The Noland Trail](http://jonahadkins.com/cartography/esri/2018/01/22/breath-of-the-wild.html). _This week_ I decided to take it a step further, and create a set of vector tiles with ArcGIS Pro.

For this version, I'd have to use global data, rather than data from my [Open Noland Trail](http://jonahadkins.com/open-noland-trail/) site. For the vector part I decided to use [Natural Earth Data](http://www.naturalearthdata.com), it's a free global dataset that's designed just for uses like this. In particular, I used:

- Roads (10m_roads)
- Coastline (50m_coastline)
- Lakes (50m_lakes)
- Bathymetry (10m_bathymetry (J,K,L))
- Parks (10m_parks_and_protected_lands)
- Populated Places (50m_populated_places)
- Country Labels (10m_admin_0_countries_lakes)
- State Labels (10m_admin_1_states_provinces)
- Ocean Labels (10m_geography_marine_polys)
- Background (50m_wgs84_bounding_box)


For land elevation, I looked into [ETOPO 1](https://www.ngdc.noaa.gov/mgg/global/global.html), the one arc-minute global relief model of Earth's surface that integrates land topography and ocean bathymetry. Since I cannot integrate the raster into the vector tiles I would need to extract both topography polygons and contours. I ran some focal statistics on the raster to smooth it out a bit, then created both contour line and polygon outputs. For display I grouped the polygons into elevations of 0, 100, 200, 300, 400, 500, 1000, 2000, and 3000 and above. I used the same grouping for the contours, but made the group breaks thicker and elevations between the breaks thinner.

Here's an animation of all the layers/groups in ArcGIS Pro before publishing as vector tiles.

![animated]({{ site.url }}/static/projects/botw2.gif)  

After creating a tile index for the world, I published the vector tiles up to ArcGIS Online. This is where it gets a bit tricky - I'm guessing there's some disconnect between styles and labels in Pro and the vector tile specification.  Here's a few issues I noticed:

- Label Stacking
-

To clean up some of these issues I used the [Beta Vector Style Editor](https://maps.esri.com/jg/VectorBasemapStyleEditor/)...I've uploaded the original style json to compare against the edited json.


Please feel free to [email me](mailto:jonahadkins@gmail.com) or hit me up on [twitter](https://twitter.com/jonahadkins) if you want some more details, copies of my ArcGIS Pro docs, or have any general questions.
