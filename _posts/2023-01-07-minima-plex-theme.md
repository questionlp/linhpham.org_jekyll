---
layout: post
title:  "Announcing Minima Plex Theme for Jekyll"
date:   2023-01-07 22:00:00 -0800
tags:   jekyll theme web-design
---

As part of setting up a personal blog, I spent a fair amount of time trying out applications (including [WriteFreely](https://writefreely.org)) and several static-site generators (including [Jekyll](https://jekyllrb.com) and [Hugo](https://gohugo.io)).

I settled on using Jekyll because I didn't want to use another application on my servers. I liked the idea of simply writing posts in Markdown and using Git for versioning. It can be hosted through GitHub Pages or other similar services.

The next step was to find a theme that I liked, which was easy to customize and extend. The default [Minima](https://github.com/jekyll/minima) ticked most of my boxes, though I wanted to change the default fonts and add the ability to display post tags.

For the default font, I had to go with the [IBM Plex](https://www.ibm.com/plex/) family of fonts, as IBM Plex Sans and IBM Plex Mono have become the go-to font for almost everything I have built. Thus, the theme includes skins that use either IBM Plex Sans or IBM Plex Serif, along with light and dark-theme variations.

I also wanted to list the tags included in the front matter of posts and provide a way to list the different tags and categories used. I used [Long Qian's blog post](https://longqian.me/2017/02/09/github-jekyll-tag/) as a starting point and extended it to include categories (as their post focused on tags). For the time being, I am manually generating the files, but their post includes a link to a [tag generator script](https://github.com/qian256/qian256.github.io/blob/master/tag_generator.py) that I could potentially use and expand upon.

If you want to try out the theme with your Jekyll install, you can add the following to the `Gemfile` for your Jekyll installation:

```ruby
gem "minima-plex", ">= 0.1.1", git: "https://github.com/questionlp/minima-plex.git"
```

In your `_config.yml` file, you can set the theme to `theme: minima-plex` or `remote_theme: questionlp/minima-plex`.

You can also check out the theme's repository at <https://github.com/questionlp/minima-plex> and a demo site at <https://questionlp.github.io/minima-plex>.
