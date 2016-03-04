# A library by any other version

When you release an open source library, it's extremely satisfying when the very first people start to use it.  It's the purest possible validation of your work on its merits.

The first people who use it are the ones who needed it so much that they were willing to overlook its green-ness and unpopularity, and it's only natural that you feel loyal to them.  As your library grows and gains exposure, people will find problems or suggest improvements, and everything is rainbows, until...

*Someone finds an issue that requires a breaking change to your existing users.*  You have built up a peaceful community of dozens of people across the world who have trusted you with their livelihoods, and some newcomer is asking you to break things just for themselves!  "Sorry friend, here's the workaround."


And that's usually the right answer.  But before you default to that, remember this: **Your early adopters needed your project so much that they were willing to overlook the fact that it was brand new.**  How often do you rely on a brand new library?  They were desperate for your widget, and they were willing to take a huge risk to get it.

**If you want to wring every last drop of value-to-the-world from your project, then you've got to accommodate people who are more conservative than your early adopters.**  And you don't have to worry too much about ruffling your existing users - you've only got twenty, and they've already overcome bigger hurdles than an API change to get this far.

"But how can I betray my loyal compatriots with a breaking change?" you ask.  That's easy, just bump the major version.  That's the whole point of the major version - if you want this update, be prepared to fix some things.  "But my library is 0.x!  It's not ready for 1.0!!!"... "But this change isn't worth going all the way to 2.0!"...  As Shakespeare once said:

> That which we call a version
> By any other name would have the same bugs
> So 1.0 would, were not it 1.0 call'd

If people are depending on your library, congratulations!!!  You have reached 1.0, whether you call it that or not.  And whether you promised to keep compatibility or not, they're going to have to fix their stuff as they follow your progress.  So if you bump the major version when you knowingly break compatibility, you're doing them a favor.  And if you don't bump the major version, well, "in for a penny, in for a pound", but it would've been nice if you had.

Just because you call your library [0.x isn't going to stop people from depending on it](http://mvnrepository.com/artifact/com.netflix.rxjava/rxjava-core).  And having a [major version number through the roof isn't going to stop them either](http://mvnrepository.com/artifact/com.google.guava/guava).

So go out, and break compatibility to [fix things that are broken](https://github.com/TomDmitriev/gradle-bundle-plugin/issues/33)!  Break compatibility to [make your library easy to adopt](https://github.com/javaslang/javaslang/issues/232)!  Get your breaking changes in [now, while your users are few and dedicated](https://github.com/diffplug/durian/commit/5f9bf016edede7a6927fa39b28b667d7050628c6)!

But most of all, have fun, and **thank you so much for releasing your code as open source!**

* [Blog](http://blog.nedtwigg.diffplug.com/a-library-by-any-other-version)
