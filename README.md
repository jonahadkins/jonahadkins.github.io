<<<<<<< HEAD
# *folio
A simple theme for showcasing your work, emphasis on whitespace, transparency, and helvetica. 


<a href="http://liabogoev.com/-folio">Live Demo</a>

<hr/>


## Features

### Collections
This Jekyll theme implements collections to let you break up your work into categories. The example is divided into poetry and portfolio, but easily revamp this into recipes, apps, short stories, limmericks, whatever your creative work is. 
> To do this, edit the collections in the config file, create a corresponding folder, and update the portfolio and poetry source files. 

Three different layouts are included—the poetry layout, for a simple list of entries, the blog layout (index.html), for more detailed descriptive list of entries, and the portfolio layout. The portfolio layout overlays a descriptive hoverover on a background image. If no image is provided, the square is auto-filled with the chosen theme color. Thumbnail sizing is not necessary, as the grid crops images perfectly. 

### Portfolio Specifics
You can easily add full pages for each of the projects in your portfolio. If you want one to link to an external website, create a file for it in _portfolio, and  fil in the YAML front matter as you would for another, but with a redirect, like so: 

	---
	layout: post
	title: Project
	description: a project that redirects to another website
	img:
	redirect: https://otherpage.com
	--- 

### Theming
Six beautiful theme colors have been selected to choose from. The default is red, but quickly change it by editing the _base.scss file in line 40. The color variable are listed there, as well. 

### Photos
Photo formatting is made simple using rows of a 3-column system. Make photos 1/3, 2/3, or full width. Easily create beautiful grids within your blog posts and projects pages. 

### Code Highlighting
This theme implements Jekyll's built in code syntax highlighting with Pygments. Just use a liquid tag to delineate your code: 
{% highlight python %}
	code code code
{% endhighlight %}


<hr/>
The MIT License (MIT)
Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=======
## My Stack Problems

> This project forked and has been modified from [A simple grey theme for Jekyll](https://github.com/liamsymonds/simplygrey-jekyll),
> and the search posts using [Super Search](https://github.com/chinchang/super-search)

### Demo
* [https://agusmakmun.github.io](https://agusmakmun.github.io)

#### Features

* Sitemap and XML Feed
* Paginations in homepage
* Posts under category
* Realtime Search Posts _(title & description)_ under query.
* Related Posts
* Highlight pre
* Next & Previous Post
* Disqus comment
* Projects page & Detail Project page
* Share on social media
* Google analytics
* HTML Minify _(Compress HTML)_ using [Jekyll Compress HTML](https://github.com/penibelst/jekyll-compress-html)

#### Screenshot

![Screenshot Post Page](https://raw.githubusercontent.com/agusmakmun/agusmakmun.github.io/master/static/img/screenshot-post-page.png  "Screenshot Post Page")

### Install & Configuration

1. Fork this repository
2. Edit site settings inside file of `_config.yml`
3. Edit your projects at file of `projects.md`, `_data/projects.json` and inside path of `_project/` _(for detail project)_.
4. Edit about yourself inside file of `about.md`

### How to Use?

**a. Add new Categories**

All categories saved inside path of `category/`, you can see existed categories.

**b. Add new Posts**

* All posts bassed on markdown syntax _(please googling)_. allowed extensions is `*.markdown` or `*.md`.
* This files can found at the path of `_posts/`.
* and the name of files are following `<date:%Y-%m-%d>-<slug>.<extension>`, for example:

```
2013-09-23-welcome-to-jekyll.md

# or

2013-09-23-welcome-to-jekyll.markdown
```

Inside the file of it,

```
---
layout: post                          # (require) default post layout
title: "Your Title"                   # (require) a string title
date: 2016-04-20 19:51:02 +0700       # (require) a post date
categories: [python, django]          # (custom) some categories, but makesure these categories already exists inside path of `category/`
tags: [foo, bar]                      # (custom) tags only for meta `property="article:tag"`
image: Broadcast_Mail.png             # (custom) image only for meta `property="og:image"`, save your image inside path of `static/img/_posts`
---

# your content post with markdown syntax goes here...
```

### Contributing

Feel free to [open a bug](https://github.com/agusmakmun/agusmakmun.github.io/issues) or [contribute to code](https://github.com/agusmakmun/agusmakmun.github.io/pulls)!
>>>>>>> 575da55c2e79e0ae872d128ac5c8885066410aab
