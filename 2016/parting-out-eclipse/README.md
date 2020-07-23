# Parting out eclipse

Whether your preferred IDE is Eclipse, IntelliJ, or a [magnetic needle and a steady hand](https://xkcd.com/378/), it's undeniable that Eclipse has many valuable components.  Want to parse and analyze Java sourcecode?  [Easy](http://help.eclipse.org/neon/topic/org.eclipse.jdt.doc.isv/reference/api/org/eclipse/jdt/core/dom/ASTParser.html).  Want to tinker with building some kind of automatic refactoring tool?  Eclipse has [low-level](http://help.eclipse.org/neon/topic/org.eclipse.jdt.doc.isv/reference/api/org/eclipse/jdt/core/dom/rewrite/package-summary.html) and [high-level](http://help.eclipse.org/neon/topic/org.eclipse.jdt.doc.isv/reference/api/org/eclipse/jdt/core/refactoring/package-summary.html) APIs for that.  Eclipse's guts aren't constrainted to just Java, it has similar APIs for [javascript](http://help.eclipse.org/kepler/topic/org.eclipse.wst.jsdt.doc/reference/api/overview-summary.html), C/C++, and probably other stuff that I don't know about.

![Dingle Dangle! by Grant. C from Flickr https://www.flickr.com/photos/grant_subaru/14175646490/in/photolist-nADTQ7-5JjmY5-5Jf8x2-5JjmHE-6eH3Kf-7JdcJP-5Jf6d4-5Jf8h6-5Jf94F-5Jjo55-5Jf84B-5Jf726-5JjnvG under https://creativecommons.org/licenses/by/2.0/  Modified by Ned Twigg to add "Eclipse" and "Your project" text](parting-out.jpg)

Unfortunately, these components are usually not published to a maven repository - they're only published to a p2 repository.  As we've [discussed before](http://discuss.diffplug.com/t/p2-maven-and-gradle), almost nobody knows how to use p2, which means that one of the hardest parts of using an eclipse component is just figuring out how to get the jar into your build.

So let's say we wanted to take the code formatter out of eclipse and use it to make a [lightweight code formatting tool](https://github.com/diffplug/spotless), with Gradle as our build system.  How would we do it?

## Grab pieces from eclipse

The [goomph](https://github.com/diffplug/goomph) project has a `p2.asmaven` plugin which tricks Gradle into thinking that a p2 repository is really a maven repository.  It looks like this in your `build.gradle`

```groovy
plugins {
	id 'com.diffplug.gradle.p2.asmaven' version '3.0.6'
}

// The jars we'd like to pull from Eclipse's p2 repositories
def eclipseDeps = [
	// The dependencies we actually use
	'org.eclipse.jdt.core',
	'org.eclipse.text',

	// Their transitives
	'org.eclipse.core.contenttype',
	'org.eclipse.core.jobs',
	'org.eclipse.core.runtime',
	'org.eclipse.core.resources',
	'org.eclipse.equinox.common',
	'org.eclipse.equinox.preferences',
	'org.eclipse.osgi'
]
// build a maven repo in our build folder containing these artifacts
p2AsMaven {
	group 'p2', {
		repoEclipse '4.6.0'
		eclipseDeps.each { p2.addIU(it) }
		eclipseDeps.each { p2.addIU(it + '.source') }
	}
}
// add these jars as dependencies
dependencies {
	eclipseDeps.each { compile "p2:${it}:+" }
}
```

You're probably asking, "Why do I have to manually specify the transitive dependencies!?"  And the answer is that p2 and maven's dependency models don't map onto each other that nicely.  Goomph [might support this in the future](https://github.com/diffplug/goomph/issues/5), but for now it's not *so* bad having to list them out by hand.

## Figure out how to use the eclipse piece

Eclipse projects generally have fantastic javadoc, but it can be hard to figure out where to go to get help and discuss the project.  Here's the algorithm I recommend to get help:

1. Check the [eclipse bugzilla](https://bugs.eclipse.org/bugs/enter_bug.cgi).  It's not the prettiest, but there's a wealth of information there, and the core developers are very active.
2. Check the [mailing lists](https://dev.eclipse.org/mailman/listinfo).  They all have searchable archives.
3. Check the [forums](https://www.eclipse.org/forums/?).  They're generally geared more towards end-users than developers, which is why I recommend checking bugzilla and the mailing lists first, but sometimes there's something good there.

If you want to see what's in the process of getting merged in, take a look at the [Eclipse gerrit instance](https://git.eclipse.org/r/#/admin/projects/), but gerrit's not particularly beginner-friendly.

## Publish your thing

If you're going to publish your thing to a public repository like maven central, you'd normally specify your dependencies in your pom.  However, it's important for all of your dependencies to also be present within that repository, and your eclipse dependencies are not.  The easiest way to fix that is to embed the classfiles from eclipse into your jar (a "fat jar"), and remove them from your maven pom.  Here's how:

```groovy
// embed the eclipse jars into our "fat jar"
jar {
	from {
		configurations.embeddedJars.collect { it.isDirectory() ? it : zipTree(it) }
	}
	// the eclipse jars are signed, and our fat jar breaks the signatures
	// so we've gotta be sure to filter out the signatures
	exclude 'META-INF/*.RSA'
	exclude 'META-INF/*.SF'
}

// remove the embedded jars from our pom
apply plugin: 'maven-publish'
publishing {
	publications {
		mavenJava(MavenPublication) {
			from components.java
			pom.withXml {
				asNode().dependencies.'*'.each() {
					if (it.groupId.text() == 'p2') {
						it.parent().remove(it)
					}
				}
...
```

If you'd like to see a working example, check out [Spotless](https://github.com/diffplug/spotless).  Just clone it and run `gradlew ide`, and you'll have a working eclipse IDE where you can play with the topics in this post.

<!---freshmark follow
output = follow;
-->
[![Watch](https://img.shields.io/github/watchers/diffplug/blog.svg?style=social&label=Watch)](https://github.com/nedtwigg/blog/subscription)
[![Star](https://img.shields.io/github/stars/diffplug/blog.svg?style=social&label=Star)](https://github.com/nedtwigg/blog/stargazers)
[![Follow @NedTwigg](https://img.shields.io/twitter/follow/NedTwigg.svg?style=social&label=Follow)](https://twitter.com/NedTwigg)
[![Medium ned.twigg](https://img.shields.io/badge/Follow-41-blue.svg?style=social&logo=medium)](https://dev.to/nedtwigg)
[![dev.to nedtwigg](https://img.shields.io/badge/Follow-0-blue.svg?style=social&logo=dev.to)](https://dev.to/nedtwigg)
<!---freshmark /follow -->
