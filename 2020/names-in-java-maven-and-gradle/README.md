# Names in java, maven, and gradle

> *A central aspect of Java's philosophy is that **names matter**.*
>
> Brian Goetz, Java Language Architect and author of Java Concurrency in Practice

## Packages

If you work for "acme.com" and you're working on a project called "foo" then [the convention](https://docs.oracle.com/javase/tutorial/java/package/namingpkgs.html) is for your root package to be `com.acme.foo`.

Being a [forward-looking bunch](https://xkcd.com/974/), we tend to add lots of "grouping" packages.  Our foo project is a utility library, and we might make other ones, so we put it into  `com.acme.util.foo`, to make sure there is space for other utility projects.  If we're really forward-looking, we'll take into account that foo is a utility library for manipulating text, so we better put it into `com.acme.util.text.foo`.  On the other hand, [YAGNI](http://thehumbleprogrammer.com/resources/mastering-yagni/mastering-yagni-you-aint-gonna-need-it-fb.jpg).

In the javascript world, there are no packages, you just get one name -  `foo` - and that's it.  I'm glad that I do most of my work on the JVM rather than a runtime which was [designed and built in 10 days](https://stackoverflow.com/questions/21139322/how-long-did-the-first-implementation-of-javascript-take/21139387#21139387), but whenever I start nesting my root package deeper than `com.acme.foo`, I try to remember that all those gobs of software being written in Node.js are getting by without any nesting at all, so maybe I can get by with 3 or 4 levels of nesting for my root package, rather than 5 or 6.

## Maven groupId:artifactId

One nice thing about `.class` files is that you don't have to pick names for them - they get their name automatically from a 1:1 mapping on the `.java` file they came from.  Unfortunately, maven asks you to pick *two* names, so it can't be that simple.  Luckily, maven also provides not only [one](https://maven.apache.org/maven-conventions.html), but [*two*](https://maven.apache.org/guides/mini/guide-naming-conventions.html) slightly different conventions for how to pick these names!  Accordingly, if you ask [StackOverflow](https://stackoverflow.com/questions/3724415/maven-artifact-and-groupid-naming), you'll see two popular answers.  And when a major library like RxJava ships a new version, you'll need a [12-screen-long debate](https://github.com/ReactiveX/RxJava/issues/6606) to figure out what the names ought to be.

Luckily, there is a mechanistic answer out there!  JitPack turns any git commit into a maven artifact at `https://jitpack.io` , which I've found to be huge improvement over `-SNAPSHOT` for integration testing.  The naming convention that it uses is:

- `com.github.{user}:{repo}` (also `com.gitlab`, `org.bitbucket`,  and `com.gitee`)
- `com.github.{user}.{repo}:{subproject}` for multi-module builds.

If you use JitPack's [custom domain](https://jitpack.io/docs/#custom-domain-name) integration, then you can replace `com.github.{user}` with `com.acme` for a professional touch.  Even if you don't use JitPack, using this convention will mean that you *could*, and it lays down a simple rule that works well enough for [all these people](https://github.com/jitpack/jitpack.io/stargazers).

## Gradle plugin id

In Gradle-land, you can apply a plugin like this: `plugins { id 'any.plugin.id.you.want' }`.  Gradle provides an excellent [guideline](https://guides.gradle.org/publishing-plugins-to-gradle-plugin-portal/):

> As a convention, we recommend you use an ID based on the reverse-domain pattern used for Java packages, for example org.example.greeting.

The trouble is, a huge number of the plugins which have been published so far are named... [`gradle-plugin`](https://plugins.gradle.org/search?term=gradle-plugin).  It seems reasonable while you're *writing* the plugin, and you don't realize how silly it is until you *use* it from a distance:

```gradle
plugins {
	id 'com.acme.gradle.foo'
	id 'org.nonprofit.bar.bar-gradle-plugin'
	id 'beetlejuice.beetlejuice.gradle'
}
```

What kind of car is that?  That's the Chevy Corvette Car.  What kind of phone is that?  It's an iPhone XS Phone.  Wouldn't this be better?

```gradle
plugins {
	id 'com.acme.foo'
	id 'org.nonprofit.bar'
	id 'beetlejuice'
}
```

It's interesting, because the guidelines that Gradle gives are very good - no excessive nesting, no unnecessary `gradle.gradle`, just the bare minimum.  And yet, a lot of the people who *use* it feel like they should add a `gradle` or two, just in case.  Probably the only way to save us from ourselves would be for the gradle tooling to search for `gradle` in the id and throw a warning, to help us think about it a little before we publish.

## Lessons
Designing namespaces is a rare opportunity.  Most of us never do it even once in our entire career.  And since nobody has experience in it, we're still making lots of beginner mistakes, even in the quarter-century-old world of java.  It's hard!  Typosquatting, [IDN homograph attacks](https://en.wikipedia.org/wiki/IDN_homograph_attack), there are so many pitfalls.  If I ever end up defining a namespace, I'm gonna try to remember these lessons:

- namespaces are helpful for identifying the author/maintainer: `com.acme.foo` 👍
- namespaces are overkill for fine-grained categories: `com.acme.util.text.foo` 👎
- defining the name to be a tuple of two other names is 👎
- if the names are all plugins to `foobar`, people are just gonna name them `my-foobar-plugin`, and it might be good to warn them that it's probably not the best choice ¯\\\_(ツ)\_/¯

<!---freshmark follow
output = follow;
-->
[![Watch](https://img.shields.io/github/watchers/diffplug/blog.svg?style=social&label=Watch)](https://github.com/nedtwigg/blog/subscription)
[![Star](https://img.shields.io/github/stars/diffplug/blog.svg?style=social&label=Star)](https://github.com/nedtwigg/blog/stargazers)
[![Follow @NedTwigg](https://img.shields.io/twitter/follow/NedTwigg.svg?style=social&label=Follow)](https://twitter.com/NedTwigg)
[![Medium ned.twigg](https://img.shields.io/badge/Follow-41-blue.svg?style=social&logo=medium)](https://dev.to/nedtwigg)
[![dev.to nedtwigg](https://img.shields.io/badge/Follow-0-blue.svg?style=social&logo=dev.to)](https://dev.to/nedtwigg)
<!---freshmark /follow -->
