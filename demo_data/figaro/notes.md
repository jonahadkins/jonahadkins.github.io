|  layer | source  | change  | comments  |
|---|---|---|---|
|  landuse_forest |  ==, class, wood |  in, kind, wood, forest, natural_wood |  n/a |  
|  landuse_grass (x3) |  ==, class, grass |  in, kind, golf_course |  no grass type in HERE data |  
|  landuse_glacier (x3) |  ==, subclass, glacier |  in, kind, glacier |  didnt see any glacier features render in HERE data |  
|  landuse_park (x3) |  source layer 'park' |  in, kind, park,national_park |   |  
|  iceshelf (x2) |  ==, subclass, glacier |   |  no ice shelf features available in HERE data |  



- island lrg/small greater/less than 12
- park lrg small on min-zoom - cant use min zoom has it changes
 look into runway/taxiway
 - admin level boundaries = 5,6
- road classifications
 - will match 1:1 for now and will get comparison screenshots

- place names and ranks
- water/ocean label classes
- poi catergories




1. restaraunt, business names
5. address point locations
6. ask about traffic circle, mini-roundabouts, roundabouts
2. where are the toll roads
4.  TRUNK ROAD COVERAGE IN SPAIN
3.  NEIGHBORHOOD coverage
7. town of ??????


["<=", ["length", ["get", "ref"]], 2]
[ ">=", [ "length", ">=",["get","shield_text],2]

[
"<=",
  [
    "get",
      [
        "length", ["get",shield_text"]
        ],
        9
        ]
]

- min_zoom attribute on changes with each zoom level, which makes it difficult to render large parks vs small parks based on the zoom level, for example, central park in new york.

- water polygon data should be filtered more at zooms 1-8

- kind = region for state boundaries in slovenia are kind of weird



madrid-13: illustrates the difference between trunk & primary style roads, as well as neighborhood names
manresa-13: illustrates the difference between trunk & primary style roads, neighborhood names, landuse for grass/meadow
lyon-12: road classifications
