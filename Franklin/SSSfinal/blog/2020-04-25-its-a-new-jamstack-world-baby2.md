+++
title = "It's a New (JAMstack) World Baby"

date = Date(2020, 4, 25)

+++

~~~
<h2>{{fill title}}</h2>
~~~
_Posted {{date}}_

*tl;dr – I created a new faster website for the SSS Blog more-or-less on my own. This post talks about why and how. Those not interested in a 10,000-foot overview of the web development world should skip this and wait for the next post.*

Welcome to the new svelte SSS Blog.

Why a new blog, when the existing one works fine?

For the past six or seven years, I’ve been learning computer programming as a hobby. I started with [Python](https://www.python.org/) and learned most of the basic programming paradigms. Python is outstanding in the area of data analysis and machine learning, so I learned a bit about that, too. I dabbled in [R](https://www.r-project.org/) (which is totally focused on data analysis) and know a small amount of [C](https://www.freecodecamp.org/news/the-c-beginners-handbook) (enough to know I don’t want to deal with it).

With a lot of time on my hands, I branched into other languages, just out of curiousity. I dabbled in “LISP” languages like [Steel Bank Common Lisp](http://www.sbcl.org) and [Clojure](https://clojure.org). The LISP languages have an entirely different style of programming, which I found very cool. Unfortunately, the ecosystem surrounding those languages is not user-friendly – it seems you have to know the languages in order to learn them (that’s even true for [Racket](https://racket-lang.org), supposedly a “teaching” language) Beginners find it hard to make their way very far (at least I did). I also took up the [Julia](https://julialang.org) language, which is similar to Python but faster and more comprehensive (its programming style is partly functional, like Clojure). Julia is a sweet language, it’s easy for beginners to pick it up, and the community is friendly. I used it to make good headway in a few online coding-challenge sites ([Project Euler](https://projecteuler.net) and [CodeWars](https://codewars.com)).

More recently, I decided to start learning more web-centric “front end” languages and frameworks. I’ve always put off learning HTML, CSS, and JavaScript (the three base components of the web) because they seemed _clunky_ and obtuse. But I’ve realized that whereas ten years ago the desktop was everything, now the web (and mobile apps) are dominant.

HTML ([Hypertext Markup Language](https://developer.mozilla.org/en-US/docs/Web/HTML)) is the language in which web pages are written; a browser like Chrome translates the HTML into the web page that you see in the browser. You can click “Control-U” on a web page to see the underlying HTML. CSS is a sort-of-language that applies _styles_ like colors and fonts to the HTML page. JavaScript is a “real” programming language that a browser can run in conjuction with a web page. JavaScript allows a web page to be dynamic and respond to user inputs.

What I’ve found is that my original belief about the _clunkiness_ and _obtuseness_ (is that even a word?) of HTML, CSS, and JavaScript was, if anything, an underestimate. The paragraph above should give insight into part of the problem – there are three separate tools that have to combine to create web pages. To fight that clunkiness, a raft of different “frameworks” have developed as a way to simplify the task of developing web pages. But these frameworks can’t undo the underlying complexity of HTML, CSS, and JavaScript, and each of those frameworks has its own unique, complicated syntax and structures that you have to learn.The entire web development landscape is chopped up and confusing. It’s taken me some time to find my way through this landscape, and the pace has been frustratingly slow.

Another motivation of mine was to free the blog from WordPress. I’ve always found WordPress (which I use for the existing SSS Blog) to be overkill for what I need. It’s a wonderful framework for folks with few programming or technical skills, especially those who want to build out a more complex set of web pages. But that comes with a cost in terms of size and speed. Since my blog is mostly words and pictures, it doesn’t take a lot of complexity to bring it into being. I also wanted to learn more about the “guts” of web development, and you can’t get that from WordPress.

More and more web sites are turning away from the traditional web paradigm (which requires databases and servers that literally build new web sites and pages anew each time they are requested) to a new one called the [JAMstack](https://jamstack.org). The idea behind the JAMstack is to generate websites and pages that are _static_ – that is, they are rendered in advance, not built anew each time someone requests them. This makes the sites much faster. Frameworks that work with the JAMstack also allow for the creation of content in “Markdown,” a framework that can provide much of what clunky old HTML does with a much cleaner, simpler syntax. You should find this site to be faster than the old one.

I’m using a program/framework called [Gridsome](https://gridsome.org) to create this new static site. Gridsome comes with a number of “themes” that take away a lot of the pain of building a site from scratch, while allowing a user to change the site to his or her liking. I’m also using [Tailwind CSS](http://tailwindcss.com) for the styling of the blog. As you can see from the address bar, the new is hosted on a subdomain of my existing domain name [newblog.ssshupe.com](https://newblog.ssshupe.com). For the foreseeable future, I’ll be posting content on both the old and new site, as the longevity of Gridsome (or my continued desire to wrestle with it, as I’ve had to do) is uncertain.

One negative change you’ll note has to do with comments. WordPress had its own comment system baked in. I considered using the [Disqus](https://disqus.com/) comment system, which is widely used by many serious publishers (including, I think, by my former local paper, the [_Press Democrat_](http://pressdemocrat.com)). I’d use it for this site, but users have to sign up to comment, and I don’t know what Disqus does with that information. Disqus also shows ads, which I don’t want to impose on readers. I’m also planning to implement a system to allow folks to subscribe to (or at least follow) the new blog. I’m still sussing through how to get a comment and subscription system up and running on this site, so stay tuned for that.

Other than the change in form, you’ll continue to see the same kind of content as on the existing SSS Blog. And pictures, of course, like these:

![Suzie and our New Dog](https://live.staticflickr.com/65535/49713584357_3b4f0086a8_c_d.jpg%22)

Suzie and our New Dog

![San Francisco Skyline and Berkeley Pier from the Marina](https://live.staticflickr.com/65535/50013872208_84608a5b3c_k_d.jpg)

SF Skyline from Treasure Island

I hope you enjoy the new site!
