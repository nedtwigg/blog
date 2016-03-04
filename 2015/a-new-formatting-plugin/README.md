# A new formatting plugin

Personally, I am of the opinion that a tab is 4 spaces, and that anytime 4 spaces get into a row then they should have been a tab.  Others believe that anything a tab can do, N spaces could have done better.  If I ran the world, an if statement without braces wouldn't compile, but others think that a syntactically unnecessary curly brace is wasting valuable bits.  Potato, Pataughto, Tomato, Tomaughto.

When working with open source projects, it is common to encounter someone who is on the other side of one of these divides.  If I end up making a contribution, I am forced to either A) work against the default settings in my tools or B) ruin my perfect default settings with their filth.  Thanks to a new Gradle plugin called [Spotless](https://github.com/diffplug/spotless), now I don't have to choose!

As far as I know, Spotless is the first formatting package to combine three key features:

* It can detect formatting violations.
* It can automatically fix any formatting violation.
* It can setup your tools (well, Eclipse, at least) so that your work stays formatted correctly as you go.

If you're using something else that you like better, I'd love to hear why!  And if you're not using Spotless already, why not?

* [Blog](http://blog.nedtwigg.diffplug.com/a-new-formatting-plugin)
