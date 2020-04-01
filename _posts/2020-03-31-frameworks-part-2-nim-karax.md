---
title: Frameworks Comparison - Part 2 - Nim + Karax
tags: web development
---

Next up in frameworks is [Karax](https://github.com/pragmagic/karax) which is written in [Nim](https://nim-lang.org/). A small snippet of what Karax for those who are interested:

```nim
include karax / prelude

var lines: seq[kstring] = @[]

proc createDom(): VNode =
  result = buildHtml(tdiv):
    button:
      text "Say hello!"
      proc onclick(ev: Event; n: VNode) =
        lines.add "Hello simulated universe"
    for x in lines:
      tdiv:
        text x

setRenderer createDom
```

Now I've written some Nim before. I did the first couple [Advent of Code 2020](https://adventofcode.com/) in Nim and I enjoyed it. Given that, I felt confident that I could get something working without too much trouble.

I was able to get my dev env setup pretty quickly and was building my little todo app. I soon ran into difficulties. The docs for Karax are still very young, so it was a lot of guesswork as to how things fit together. Nim's error messages are usually helpful, but not enough for me to get a working todo app.

So I went the easy route and copy/pasted the example one from Karax's repo with the goal to modify it. Sadly this didn't last too long as I hit error after error, finally giving up when I got this error `Error: expression 'filter(maybeTodos, isSome)' cannot be called` when trying to load my saved todos from localStorage.

I also struggled with understanding how events work with Karax, which is what got me to skip to just copy/pasting their example in the first place. Nim's error messages just weren't helpful enough to get through the struggles either. I'll probably skip Karax for now and leave Nim for non-JavaSCript projects.

### [Updated 2020-04-01]

After publishing this post a friend contacted me and explained why I was getting that error, `Error: expression 'filter(maybeTodos, isSome)' cannot be called`. I had a variable `filter` defined up above from the copy/pasted code, so that one is one me. I figured it was only fair that I go back to the code and try a little harder, see if I can get a little further.

I did manage to get a lot more working. My todos are now stored locally as a sequence of `Todo` objects (similar to a struct or a record) instead of storing the todo content, completed status, and id as separate values in localStorage and querying localStorage every time.

I did eventually give up on finishing it as it felt like it was taking way too long to work with JS and Nim together. As I said originally, I'll probably leave Nim for non-JavaScript projects.
