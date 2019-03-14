---
layout: post
title:  "Using Multiple Sources in Esri Vector Tiles"
date:   2019-03-08
categories: [esri, cartography, OpenStreetMap]
---

<hr>

Continuing on with my exploration of what's possible in Esri Vector Tiles, the latest update to ArcGIS Pro allows for [multiple source vector tiles](https://pro.arcgis.com/en/pro-app/help/mapping/map-authoring/multiple-vector-tile-sources.htm) to viewed in a desktop environment.  

This is the beginning of great improvement to Esri's vector tile offering - once implemented in their ArcGIS Online environment, this will allow users to access a wide variety of published vector tiles.   

A few examples of this might be:

<hr>

![amenities](https://www.jonahadkins.com/static/projects/vt_3a.jpg)  

<hr>

adding amenities / POI's from OpenStreetMap to their locally published basemap - this would be a killer enhancement to any organizations basemap, adding restaurants, businesses, bus stops, and many other places that are otherwise hard to collate. The above sample grabs building footprints from Roanoke County, Va Open Data and adds all shops and amenities from Esri's OpenStreetMap Vector tiles. Adding multiple sources requires downloading the style json from ArcGIS Online and editing the `sources` section like:

{% highlight javascript %}
"sources": {
    "esri": {
      "url": "https://basemaps.arcgis.com/arcgis/rest/services/OpenStreetMap_v2/VectorTileServer",
      "type": "vector"
    },
    "roanoke": {
      "url": "https://tiles.arcgis.com/tiles/VlZ73DcE2ya6FnSK/arcgis/rest/services/test_bldg_vt/VectorTileServer",
      "type": "vector"
    }
  }
{% endhighlight %}  

[Download](https://www.arcgis.com/home/item.html?id=03f103a9d5444ba498a75e15b593f36e) this sample or select Open in ArcGIS Pro from the item page to preview.

<hr>

![amenities](https://www.jonahadkins.com/static/projects/vt_3b.jpg)  

<hr>

This second example compares building footprints from Esri Community Basemap vector tiles to building footprints in OpenStreetMap (via Esri's vector tiles) - One might use this to see which offers the best coverage for a particular area  - or if added as two separate services, run some geoprocessing tasks to determine missing footprints from one to the other. [Download](http://www.arcgis.com/home/item.html?id=b2008cbf185744f59916faf055639a65) this sample or select Open in ArcGIS Pro from the item page to preview.

[email me](mailto:jonahadkins@gmail.com) or hit me up on [twitter](https://twitter.com/jonahadkins) if you want some more details or have any general questions.
