---
layout: post
title:  "The Open (Data) Roads of Virginia"
date:   2017-08-23
categories: [cartography, esri, data]
---

I've been practicing some self-taught cartography lately, focusing on colors and simplicity of visualizing data. There's been quite a bit of open data to explore with recent releases here in Virginia through the State's GIS org., [VGIN](http://vgin.maps.arcgis.com/apps/PublicGallery/index.html?appid=d08a08ad5567483a903c34d6553e8ace) and [VDOT](http://www.virginiaroads.org/datasets?content=spatial%20dataset) the State's transportation org.  

Using ArcGIS Pro and  some of these datasets, I've created a series of (hopefully) easy to understand maps, using some non-default, non-standard, color combinations. There's definitely nothing new or particularly awesome about the techniques used, but some of the patterns that emerge are pretty neat.  



## Every ___ In Virginia

### Top 6 Road Suffix Types by Segment Count using the VGIN/VDOT State Road Centerline (RCL) file.

It appears "Road" is the most popular across the state, and "Court" is particularly dense in high-population residential areas.

---

![types]({{ site.url }}/static/projects/roads_types.jpg)  

---


## Virginia Roads by Speed

### VDOT Speed Limit centerline file

Very simple visualization using overlapping transparencies and line thickness's.

---

![speed]({{ site.url }}/static/projects/roads_speed.jpg)  

---


## Most Common Street Names in the Commonwealth

### Top 6 Street Names by Segment Count using the VGIN/VDOT State Road Centerline (RCL) file.

Virginia's history shows pretty strong here and no surprise "Virginia"  makes the top 6.

---

![names]({{ site.url }}/static/projects/roads_names.jpg)

---


## Longest Roads by Name in the Commonwealth

### Top 6 Unique Roads by Length using the VDOT LRS Route Overlap file.

The LRS file from VDOT contains a single (1) record for every named road in the State, which is awesome in itself.

---

![longest]({{ site.url }}/static/projects/roads_longest.jpg)

---


## Average Daily Traffic

### VDOT Traffic Volume Layer

Again, using overlapping transparencies and line thickness's, this is more or less a population map but shows some nice patterns of non-interstate travel.

---


![traffic]({{ site.url }}/static/projects/traffic.jpg)

---


## Crash Rate Analysis

### VDOT Crashes file & VDOT Traffic Volume

For this **non-expert** analysis, I defined square mile bins summarizing data from both crash locations and volume of traffic to determine some rudimentary crash rate areas.

---


![crash]({{ site.url }}/static/projects/crash_rate.jpg)

---


## Age of Bridges

### VDOT Bridges and Culverts file by Age.

Using a similar binning technique as above, this map shows the average age of bridges per square mile.

---


![bridge]({{ site.url }}/static/projects/bridge_age.jpg)

---



Please feel free to [email me](mailto:jonahadkins@gmail.com) or hit me up on [twitter](https://twitter.com/jonahadkins) if you want some more details, copies of my ArcGIS Pro docs, or have any general questions.

Much thanks to John and Gretchen for various carto-shoulder leaning while making these maps!
