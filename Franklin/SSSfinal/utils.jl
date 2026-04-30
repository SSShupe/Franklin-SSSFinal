using Dates
using HTTP
using XMLDict

"""
    {{blogposts}}

Plug in the list of blog posts contained in the `/blog/` folder.
"""
@delay function hfun_blogposts()
    today = Dates.today()
    curyear = year(today)
    curmonth = month(today)
    curday = day(today)

    list = readdir("blog")
    filter!(x -> !startswith(x, "index"), list)
    sorter(p) = begin
        ps = splitext(p)[1]
        url = "/blog/$ps/"
        surl = strip(url, '/')
        pubdate = pagevar(surl, :date)
        if isnothing(pubdate)
            return Date(Dates.unix2datetime(stat(surl * ".md").ctime))
        end
        return Date(pubdate, dateformat"d U Y")
    end
    sort!(list, by=sorter, rev=true)

    io = IOBuffer()
    write(io, """<ul class="blog-posts">""")
    for (i, post) in enumerate(list)
        if post == "index.md"
            continue
        end
        ps = splitext(post)[1]
        write(io, "<li><span><i>")
        url = "/blog/$ps/"
        surl = strip(url, '/')
        title = pagevar(surl, :title)
        pubdate = pagevar(surl, :date)
        if isnothing(pubdate)
            date = "$curyear-$curmonth-$curday"
        else
            date = Date(pubdate, dateformat"d U Y")
        end
        write(io, """$date</i></span><a href="$url">$title</a>""")
    end
    write(io, "</ul>")
    return String(take!(io))
end

"""
    {{custom_taglist}}

Plug in the list of blog posts with the given tag
"""
function hfun_custom_taglist()::String
    tag = locvar(:fd_tag)
    rpaths = globvar("fd_tag_pages")[tag]
    sorter(p) = begin
        pubdate = pagevar(p, :published)
        if isnothing(pubdate)
            return Date(Dates.unix2datetime(stat(p * ".md").ctime))
        end
        return Date(pubdate, dateformat"d U Y")
    end
    sort!(rpaths, by=sorter, rev=true)

    io = IOBuffer()
    write(io, """<ul class="blog-posts">""")
    # go over all paths
    for rpath in rpaths
        write(io, "<li><span><i>")
        url = get_url(rpath)
        title = pagevar(rpath, :title)
        pubdate = pagevar(rpath, :published)
        if isnothing(pubdate)
            date = "$curyear-$curmonth-$curday"
        else
            date = Date(pubdate, dateformat"d U Y")
        end
        # write some appropriate HTML
        write(io, """$date</i></span><a href="$url">$title</a>""")
    end
    write(io, "</ul>")
    return String(take!(io))
end

function hfun_try()
    io = IOBuffer()
    write(io, """<ul class="blog-posts">""")
    list = reverse(readdir("blog/"))
    # titles = ["List", "of", "fake", "titles"]
    filter!(x -> !startswith(x, "index"), list)
    titles = [pagevar("blog/" * i, "title") for i in list]
    dates = map(x -> x[1:10], list)
    to_dtime = map(x -> x = Date(x, DateFormat("y-m-d")), dates)
    dates_formatted = map(x -> Dates.format(x, "U d, Y"), to_dtime)
    rpaths = map(x -> replace(x, r"\.md$" => ""), list)
    for i in 1:length(list)
        write(io, "<li><span><i>")
        write(io, """$(dates_formatted[i])</i></span><a href="$(rpaths[i])">$(titles[i])</a>""")
    end
    write(io, "</ul>")
    return String(take!(io))
end

function hfun_photos()
    call = HTTP.get("https://www.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=1a77359c736a2f7546c1797c832ff5cf&user_id=11155423%40N00&format=rest")
    last100 = String(call.body) |> parse_xml
    ids = String[]
    titles = String[]
    for i in 1:25
        push!(ids, last100["photos"]["photo"][i][:id])
        push!(titles, last100["photos"]["photo"][i][:title])
    end
    sizeCallList = String[]
    for id in ids
        push!(sizeCallList, "https://www.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=1a77359c736a2f7546c1797c832ff5cf&photo_id=$(id)&format=rest")
    end
    large_urls = String[]
    for p in sizeCallList
        r = HTTP.get(p)
        rs = String(r.body)
        prs = parse_xml(rs)
        push!(large_urls, prs["sizes"]["size"][12][:source])
    end
    io = IOBuffer()
    for i in 1:25
        write(io, """<figure><img src="$(large_urls[i])" alt=""/><figcaption><center><b>"$(titles[i])"</b></center></figcaption></figure><br>""")
    end
    return String(take!(io))
end

function hfun_date()
    d = locvar("date")
    return Dates.format(d, "U d, Y")
end

