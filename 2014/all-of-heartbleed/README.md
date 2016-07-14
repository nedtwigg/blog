# All of heartbleed

One of my pet peeves is when someone says "basically, the floober is flabbing", when the entire thing they're describing is just a flabbing floober. The "basically" implies that there's special knowledge that you'd need to be an expert to understand, but if they've actually told you the whole story, then it's leaving a false impression.

Here's a fantastic explanation of how Heartbleed works, by [xkcd](http://xkcd.com/1354/). Not "basically" how it works, this is exactly how the entire thing works.

If you're really curious, you can even look at the actual code that caused this whole kerfuffle:

[![Heartbleed Explanation](http://imgs.xkcd.com/comics/heartbleed_explanation.png)](http://xkcd.com/1354/)

Search for `memcpy(bp, pl, payload)` and you'll find the bug.

This is a command that copies `payload` number of bytes from `pl` (which is what the user sent - `POTATO`, `BIRD`, `HAT`, etc.) into `bp` (which is sent back to the user). But the programmer forgot to check whether payload matched the actual length of what the user sent in pl.  So when the user asks for 500 bytes of `HAT`, it will copy `HAT` for the first 3 bytes, and then whatever happens to be next in your computer's memory for the remaining 497. The real bug lets the user copy 64 thousand bytes at a time.

And that's why all your passwords are ruined now. Not basically why - all of why.

<!---freshmark follow
output = follow;
-->
* [Follow @DiffPlug](https://twitter.com/DiffPlug)
* [Follow @NedTwigg](https://twitter.com/NedTwigg)
* [Medium](https://medium.com/diffplug)
* [Facebook](https://www.facebook.com/DiffPlug)

<!---freshmark /follow -->
