---
layout: post
title:  "Editing Esri Vector Tiles in Maputnik"
date:   2017-06-15
categories: [cartography, esri, mapbox]
---


[Maputnik](http://maputnik.com) is an open source visual based style editor for vector maps using the Mapbox-GL specification. It allows you to take a `.json` file and edit it's contents visually. This is especially helpful if you like seeing changes you make to a style as they happen on the map and not in a text editor.  

There are several existing ways to edit Esri vector tiles which include, editing the file in a text editor like Atom, or using either of the beta tools from Esri like [this one](http://maps.esri.com/jg/VectorBasemapStyleEditor/) or [that one](http://esri.github.io/arcgis-vectortile-style-editor).  

To get started editing, grab any of the hosted Esri vector tile json files from the [vector basemap group](https://www.arcgis.com/home/group.html?id=30de8da907d240a0bccd5ad3ff25ef4a&q=&focus=maps) - for this example, I'm using the [Navigation Map](https://www.arcgis.com/home/item.html?id=e19e9330bf08490ca8353d76b5e2e658). More info on how to do this in your ArcGIS Online account can be found here on the [ArcGIS Blog](https://blogs.esri.com/esri/arcgis/2015/11/19/how-to-customize-esri-vector-basemaps/).

After the .json file saved, we need to edit one of the source parameters to expose the raw tiles to the viewer and add a style id.  

Open up the file in a text editor and at the top of the file add an id parameter.

**It will look like this before:**

{% highlight javascript %}
{
    "layers": [{
        "paint": {
            "background-color": "#b6deff"
        },
        "type": "background",
        "id": "background"
    },
{% endhighlight %}

**And this after:**

{% highlight javascript %}
{   "id": "navigation",
    "layers": [{
        "paint": {
            "background-color": "#b6deff"
        },
        "type": "background",
        "id": "background"
    },
{% endhighlight %}

Now find the entry `"Sources"`. Replace the `"url"` parameter with the `"tiles"` parameter.  

**It will look like this before:**

{% highlight javascript %}
"sources": {
    "esri": {
        "url": "https://basemaps.arcgis.com/v1/arcgis/rest/services/World_Basemap/VectorTileServer",
        "type": "vector"
    }
}
{% endhighlight %}  

**And this after:**

{% highlight javascript %}
"sources": {
"esri": {
  "type": "vector",
  "tiles": [
    "https://basemaps.arcgis.com/v1/arcgis/rest/services/World_Basemap/VectorTileServer/tile/{z}/{y}/{x}.pbf"
  ]
}
}
{% endhighlight %}  

Save your changes.  

You can load the .json file with changes to the online version of the [Maputnik Editor](http://maputnik.com/editor), or use the steps below to edit the style with Maputnik in your local environment.  

Hopefully we can avoid all this when editing Esri Vector tiles is *supported in ArcGIS Pro.*  

To get up and running with Maputnik locally in a Mac environment, there are few command line steps:  
 - Start up your CLI.  
 - cd to the directory you saved the .json file.  
 - Download the latest mac release using `wget https://github.com/maputnik/editor/releases/download/v1.0.1/maputnik_darwin`  
 - Ensure it's executable from the CLI `chmod +x maputnik_darwin`  
 - Rename it to maputnik `mv maputnik_darwin maputnik`  
 - Run `./maputnik --file navigation.json --watch`  

You now have a local server running maputnik with your vector style! Navigate to `http://localhost:8000`.  

You should be able to see the map and all the layer and their styles on the left panel. Changes should be automatically saved because we added the `--watch` when we started the server on the CLI. After your changes, navigate to your original file in your ArcGIS Online account and use update option to replace the original file. See your changes by adding the layer to a new map in ArcGIS Online.  
