---
layout: post
title:  "Paid Mappers - A Year of Edits"
date:   2016-08-15
categories: [cartography, mapbox, OpenStreetMap]
---

### tl:dr    
Check out the Paid Mappers [annual report](http://paidmappers.github.io/home/) or explore the [interactive map](http://jonahadkins.com/pm_edits.html).  


We just finished our first year over at [paid mappers](http://paidmappers.Github.Io/home/) - a start-up dedicated to high-def mapping in OpenStreetMap. We absolutely <3 osm, and we've been busy over the last year populating southeastern Virginia with all sorts of great content. While none of our edits were "Paid", I wanted to generate stats and maps of our first year in business. The final product of that is the "Annual report" section (pic below) which features a static image from the studio project with corresponding stats. I've added to that an [interactive map](http://jonahadkins.com/pm_edits.Html) which allows you to explore the region in more detail. Included below are the steps I used to generate these products, enjoy!  

![pm1]({{ site.url }}/static/projects/paid-mappers.png)  

*Final Implementation Screenshot*  

### Data  
[QA-Tiles](https://osmlab.github.io/osm-qa-tiles/) are a great resource for current & historic edits in OSM. Grab a download for your area of interest - in this example, North America `united_states_of_america.mbtiles`  

### Extract   
To reduce processing time, I used [MBTiles-Extracts](https://github.com/mapbox/mbtiles-extracts) - this module will allow you to clip the area (North America) to a smaller extent (Southeastern Virginia), which will speed up any further steps in processing time. I then created a bounding box in geojson.io with a property name of "bbox". Then at the command line:  

`npm install mbtiles-extracts
 mbtiles-extracts united_states_of_america.mbtiles bbox.geojson bbox`  

 This step reduced the QA-Tile download from 4.25gb to 445mb -> much easier to work with on the MacBook Pro.  

### Tile-Reduce   

To start analyzing the data, I looked into running some tile-reduce processes, which provides super-fast analysis on mbtiles. I originally looked at working with a [fork](https://github.com/jonahadkins/QA-FLTR) that had the bones of what I was trying to do, but I ran into issues streaming a large amount of features to the output file. After that, I stumbled upon [OSM-Tag-Stats](https://github.com/mapbox/osm-tag-stats) which did a decent amount of what I wanted. I regularly try to not re-invent things that already work great, so I decided to go with it.

Clone or download the repo into your working directory and `npm install` to get it running. Using the [documentation](https://github.com/mapbox/osm-tag-stats/blob/master/README.md) , I created a command line based filter to extract edits from all my OSM accounts and specific time frame (1 year or so)

`osm-tag-stats --geojson=output.geojson --mbtiles='input.mbtiles' --users='lots, of, comma, separated, osm, usernames' --dates='07/01/2015, 08/01/2016'`

This took about 4 minutes to process 6,222 tiles.

>It's very important to note that QA-Tiles contains the latest and greatest of OSM. So, for example, if another OSM user edits any features you edited or created, they won't be included. Getting the entire edit history per feature is a whole other process separate from what I was doing.

The resulting geojson was 256mb, down from 445mb. OSM-Tag-Stats is a great resource that makes querying the OSM data really simple by using the [Mapbox GL Filter Spec](https://www.mapbox.com/mapbox-gl-style-spec/#types-filter).

Another way to get some info out of the resulting geojson, is using a sql query at the command line with ogr2ogr. To get a count of new edits vs existing edits, I ran a query for each `version`. An edit with a version of 1 would be a brand new feature to OSM, and anything above to would represent an existing feature that was edited.

`ogrinfo alledits.geojson -sql " SELECT COUNT(*) FROM OGRGeoJSON WHERE '@version' = 1 "`  
Edits with a version of 1 = 345,450  

`ogrinfo alledits.geojson -sql " SELECT COUNT(*) FROM OGRGeoJSON WHERE '@version' != 1 "`  
Edits with a version >1 = 7,091

### Tippecanoe  
After filtering & querying for various types of stats, I want to map the output file. I used tippecanoe on the [Bridges](http://jonahadkins.github.io/2016/03/22/bridges_of_america.html) project, and knew it would be my go to here. With a fresh update (`brew update tippecanoe`), and a brief look at the [docs](https://github.com/mapbox/tippecanoe) for command line options:  

`tippecanoe -y version -ag -pd -o output.mbtiles input.geojson -Z6`  

It runs like Katie Ledecky swims - _fast_. The output .mbtiles is about 25mb down from 256mb, down from 445mb, down from 4.2gb. Just crazy.  

![pm2]({{ site.url }}/static/projects/paid-mappers-2.png)  

*Edits in BLUE indicate a new feature added to OpenStreetMap. Edits in ORANGE indicate an edit to an existing OpenStreetMap feature.*  

### Mapbox Studio    
After loading up the mbtiles to studio, I do some basic attribute styling on the 'version' field and setup up scale dependent rendering - really just wanted to keep this simple and focus on the contrast of new vs existing edits with basic OSM data in the background.    

The [interactive](http://jonahadkins.github.io/pm_edits.html) makes use of `jumpTo` and `flyTo`, as well as pitch (sparingly) for the bookmark zoom buttons. Feel free to [peruse the code](https://github.com/jonahadkins/jonahadkins.github.io/blob/master/pm_edits.html)!   

### Fin   
Lots of good stuff to learn in these tools, mostly thanks to all the people involved in creating and maintaining them.  

For more info about Paid Mappers, <a href="mailto:jonahadkins@gmail.com?Subject=PaidMappers" target="_top">drop us a line</a> or [visit our page.](http://paidmappers.github.io/home/)
