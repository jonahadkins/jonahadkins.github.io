---
layout: post
title:  "Esri Leaflet Marker Cluster Example"
date:   2017-06-14
categories: [cartography, esri, leaflet]
---

### tl:dr   
Check out [Alternative Fueling Stations](http://jonahadkins.com/demo/altfuel.html).  

![el]({{ site.url }}/static/projects/altfuel.png)  


This quick demo shows how to cluster points using the `markercluster` plugin for Esri Leaflet. Building off of the great [styling clusters](https://esri.github.io/esri-leaflet/examples/styling-clusters.html) example, this demo uses a feature layer of US Alternative Fueling Stations from the [HIFLD Open Data](https://hifld-dhs-gii.opendata.arcgis.com/datasets/13c68a8ccb4645b587e1b9d854c7f7cd_0).  

The clusters are sized & styled by the number of digits (1 thru 4) in the count of points assigned to each cluster, and then the layer is called using `L.esri.Cluster.featureLayer` as shown below:  


{% highlight javascript %}
L.esri.Cluster.featureLayer({
    url: 'https://services2.arcgis.com/1cdV1mIckpAyI7Wo/arcgis/rest/services/Non_Gasoline_Alternative_Fueling_Stations/FeatureServer/0',
    spiderfyOnMaxZoom: false,
    disableClusteringAtZoom: 16,
    polygonOptions: {
        color: '#355C7D',
        weight: 2,
        opacity: 1,
        fillOpacity: 0.5
    },
{% endhighlight %}  

Full code for this sample [available here](https://github.com/jonahadkins/jonahadkins.github.io/blob/master/demo/altfuel.html)
