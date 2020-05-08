---
title: Framework Agnostic Localization
tags: web development localization
---

[Updated on 2020-05-08: Changed example to match current release.]

Across my various web projects, adding localization has always required learning how to use my current framework's popular localization library. It was always frustrating having to learn a new library to get the same localization files on the screen. I assumed I was the only one having this problem so I went about my work accepting it as fact. Recently though I began hearing of others having the same struggle, and it finally came to me. Web components!

At the same time I was also reading about [Fluent](https://projectfluent.org/), a more modern approach to localization.

Combined with my interest in making localization easier and wanting to use Fluent in my apps, I built [@wolfadex/fluent-web](https://www.npmjs.com/package/@wolfadex/fluent-web). Now I can add localization to any web app without spending time learning a new library! Check out the demo below to see it in action.

<iframe src="https://wolfadex.github.io/fluent-web/" width="400" height="850" style="border: none;"></iframe>

The bare minimum to get `Hello, World!` on the screen is:

1. Install `@wolfadex/fluent-web` and `@fluent/bundle`
1. Add a `fluent-text` web component to your html
   ```html
   <fluent-text id="my-text-element" messageid="hello"></fluent-text>
   ```
1. Build a resource, and add it to your component

   ```js
   import "@wolfadex/fluent-web";
   import { FluentResource, FluentBundle } from "@fluent/bundle";

   const resource = new FluentResource(`
   hello = Hello, Fluent!
   `);
   const bundle = new FluentBundle("en-US");
   bundles.addResource(resource);

   const textEl = document.getElementById("my-text-element");

   textEl.bundles = [bundle];
   ```

1. Get your result `Hello, Fluent!`

For more information on how to use it please check out the [docs](https://github.com/wolfadex/fluent-web/blob/master/docs/index.md).

I do plan on migrating the docs to use `fluent-web`. Any help with localizing would be most appreciated as I only spean American English and ASL. I've created an [GitHub issue](https://github.com/wolfadex/fluent-web/issues/8) to keep track of which locales are in progress and which are completed.

Lastly I'd like to thank @turboMaCk, @toastal, and @BrianHicks for providing the extra localizations in the demo, and the [Fluent](https://projectfluent.org/) team for their great feedback and for building Fluent.
