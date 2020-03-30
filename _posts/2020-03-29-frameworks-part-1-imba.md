---
title: Frameworks Comparison - Part 1 - Imba
tags: web development
---

I decided to go ahead and test out various front end frameworks. I wanted to see what I can learn from them, what I enjoy, and what I find difficult. For each I'll be building a basic Todo app that stores values in localStorage, and a Quiz app that stores scores in localStorage. If you'd like to see the code, it'll be available ay [github.com/wolfadex/framework-comparison](https://github.com/wolfadex/framework-comparison).

The Todo app is just for learning the framework and getting used to it. The Quiz app will be for something a little more involved, and will involve http requests. These won't be any sort of definitive "you should use this tool" type of posts, just what I experience.

---

First up in the series is [Imba](https://www.imba.io/). I've been aware of Imba for a little while now but have never taken the dive into exploring it, so here I go! I'm already slightly familiar with the syntax, which is based of off Ruby. Just a quick example:

```imba
import {Todo} from './store'

tag App
	prop todos

	def addTodo
		@todos.push Todo.new(@newTodoTitle)

	def render
		<self>
			<form.header :submit.prevent.addTodo>
				<input[@newTodoTitle] placeholder="Add...">
				<button type='submit'> 'Add item'
			<ul> for todo in @todos
				<li> todo.title

Imba.mount <App.vbox todos=[]>
```

I attempted to figure out how to build a todo app without copy/pasting, just reading docs and trying to understand. I struggled quite a bit with that. I could get things rendering and some of the error messages were helpful, but even after copy/pasting the example I found it difficult to modify. For example, the [docs](https://docs.imba.io/the-syntax/basics/objects-and-object-properties) say you can access object properties by either `obj.prop` or `obj['prop']` but both kept giving me runtime errors.

Given this, I probably won't be building the Quiz app with Imba. I do hope that work on it continues, and maybe I can try it again some day.
