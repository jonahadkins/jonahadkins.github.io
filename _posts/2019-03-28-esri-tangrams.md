---
layout: post
title:  "Esri OpenStreetMap Vector Tiles in Tangram"
date:   2019-03-28
categories: [esri, cartography, OpenStreetMap]
---

<hr>

[Tangram](https://github.com/tangrams/tangram) is a javascript library for rendering 2d & 3d maps in the browser using Web GL. It allows for some pretty [complex visualizations of maps](xhttp://tangrams.github.io/tangram-sandbox/) that include the use of light sources, shaders, animation, and textures.

<hr>

![tangram]({{ site.url }}/static/projects/tangram.gif)  

<hr>

Since Tangram supports the Mapbox `MVT` tile format, I wanted to try and leverage Esri's OpenStreetMap Vector Tiles. [Check out the app]({{ site.url }}/yoooooo.html) or [view the messy code](https://github.com/jonahadkins/jonahadkins.github.io/blob/master/yoooooo.html)

The map is viewed through the Tangram Leaflet Plugin and reads from a `.yaml` that stores the styling. You can add Esri's OSM tiles like this:

{% highlight yaml %}
sources:
    esri:
        type: MVT
        url: https://basemaps.arcgis.com/arcgis/rest/services/OpenStreetMap_v2/VectorTileServer/tile/{z}/{y}/{x}.pbf
{% endhighlight %}  

..then add land polygons

{% highlight yaml %}
land small scale:
    data: { source: esri, layer: 'land (small scale)' }
    draw:
        polygons:
            order: 0
            color: '#f4f4f4'
{% endhighlight %}

..and finally add some country labels  

{% highlight yaml %}
country label:
    data: { source: esri, layer: 'country/label' }
    draw:
        text:
            priority: 10
            anchor: center
            text_source: global.esri_name
            font:
                size: [[2,12],[5,14]]
                transform: uppercase
                fill: '#aaafac'
                stroke:
                    color: '#f7f7f7'
                    width: 2
{% endhighlight %}

since quite a few layers in the tiles store the main labeling attribute under the column name `_name`, you can add a global property at the top of the `.yaml` to point your labels to (`text_source: global.esri_name` in the above example)

{% highlight yaml %}
global:
    esri_name: |
        function() {
            { return feature._name; }
        }

{% endhighlight %}  

This is a _very_ simple example that doesnt even scratch the surface of Tangram's capabilities. Check out the code for the [entire yaml here](https://github.com/jonahadkins/jonahadkins.github.io/blob/master/demo_data/esri.yaml)

As usual, [email me](mailto:jonahadkins@gmail.com) or hit me up on [twitter](https://twitter.com/jonahadkins) if you want some more details or have any general questions.
