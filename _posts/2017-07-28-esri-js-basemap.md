---
layout: post
title:  "Custom Basemaps in Esri Javascript 4.x"
date:   2017-07-28
categories: [cartography, esri]
---

![fireflies]({{ site.url }}/static/projects/fireflies.png)

Here's a quick sample that demonstrates adding a custom basemap with some additional layers in the Esri Javascript 4.x API.

Check out [Demo Link](http://jonahadkins.com/demo/basemap4x.html) and view the code for the demo app [on github](https://github.com/jonahadkins/jonahadkins.github.io/blob/master/demo/basemap4x.html)

In this example, I'm using the new **Firefly** Basemap created by [John Nelson](https://twitter.com/John_M_Nelson) at Esri. This new basemap, along with some great techniques he has [blogged about](https://blogs.esri.com/esri/arcgis/2017/06/28/firefly-basemap/) demonstrate some pretty cool custom mapping options.



**Normal Esri Basemap Snippet**

{% highlight javascript %}
  var map = new Map({
  basemap: "streets"
        });

  var view = new MapView({
  container: "viewDiv",
  map: map,
  zoom: 4,
  center: [-98, 38]
  });
{% endhighlight %}

**Custom Basemap Snippet**

{% highlight javascript %}
var map = new Map();

var layer = new TileLayer({
    url: "https://servicesbeta.arcgisonline.com/arcgis/rest/services/Firefly_World_Imagery/MapServer"
});
map.add(layer);

var view = new MapView({
    container: "viewDiv",
    map: map,
    zoom: 4,
    center: [-98, 38]
});

view.constraints = {
    minZoom: 3,
    maxZoom: 5
};
{% endhighlight %}

Remember to load your **requires and functions** before!  

{% highlight javascript %}
require([
    "esri/Map",
    "esri/layers/TileLayer",
    "esri/views/MapView",

    ...
    ..
    .

    ], function(Map, TileLayer, MapView,    
{% endhighlight %}  

The steps above will allow you to control and style your layers individually in your code, but you could definitely add the basemap and layers in an AGOL map and reference the `id` using [this sample](https://developers.arcgis.com/javascript/latest/sample-code/layers-portal/index.html).
