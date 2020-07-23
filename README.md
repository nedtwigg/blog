# Ned Twigg's blog

<!---freshmark shields
output = [
	link(image('JitCI', 'https://jitci.com/gh/nedtwigg/blog/svg'), 'https://jitci.com/gh/nedtwigg/blog'),
	link(shield('License Apache', 'license', 'Apache', 'brightgreen'), 'https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)'),
	'',
	link(shield('Twitter', 'twitter', '@NedTwigg', 'blue'), 'https://twitter.com/NedTwigg'),
	link(shield('dev.to', 'dev.to', 'nedtwigg', 'blue'), 'https://dev.to/nedtwigg'),
	link(shield('Medium', 'medium', '@ned.twigg', 'blue'), 'https://medium.com/@ned.twigg'),
	].join('\n');
-->
[![JitCI](https://jitci.com/gh/nedtwigg/blog/svg)](https://jitci.com/gh/nedtwigg/blog)
[![License Apache](https://img.shields.io/badge/license-Apache-brightgreen.svg)](https://tldrlegal.com/license/apache-license-2.0-(apache-2.0))

[![Twitter](https://img.shields.io/badge/twitter-%40NedTwigg-blue.svg)](https://twitter.com/NedTwigg)
[![dev.to](https://img.shields.io/badge/dev.to-nedtwigg-blue.svg)](https://dev.to/nedtwigg)
[![Medium](https://img.shields.io/badge/medium-%40ned.twigg-blue.svg)](https://medium.com/@ned.twigg)
<!---freshmark /shields -->

I put all my blog posts here so that I can run CI on the code examples, and make it easy for you to grab them if you'd like to.  Feel free to raise issues if you'd like to talk about something, or submit PR's if you see any mistakes.

<!---freshmark toc
var githubLink = function(title, date) {
	var year = date.substring(date.lastIndexOf(' ') + 1);
	var folder = title.toLowerCase().replace(/[, ]+/g, '-');
	if (title === 'version = f(changelog)') {
		folder = 'version-equals-f-of-changelog'
	}
	var url = 'https://github.com/diffplug/blog/tree/master/' + year + '/' + folder;
	return '* ' + link(title, url) + ' (' + date + ')';
};
output = [
	githubLink('version = f(changelog)',			'July 22, 2020'),
	githubLink('Names in java, maven, and gradle',	'January 23, 2020'),
	githubLink('Parting out Eclipse',				'August 17, 2016'),
	githubLink('P2, Maven, and Gradle',				'July 14, 2016'),
	githubLink('A library by any other version',	'May 15, 2015'),
	githubLink('A new formatting plugin',			'May 13, 2015'),
	githubLink('All of heartbleed', 				'April 11, 2014'),
	'', ''
	].join('\n');
-->
* [version = f(changelog)](https://github.com/diffplug/blog/tree/master/2020/version-equals-f-of-changelog) (July 22, 2020)
* [Names in java, maven, and gradle](https://github.com/diffplug/blog/tree/master/2020/names-in-java-maven-and-gradle) (January 23, 2020)
* [Parting out Eclipse](https://github.com/diffplug/blog/tree/master/2016/parting-out-eclipse) (August 17, 2016)
* [P2, Maven, and Gradle](https://github.com/diffplug/blog/tree/master/2016/p2-maven-and-gradle) (July 14, 2016)
* [A library by any other version](https://github.com/diffplug/blog/tree/master/2015/a-library-by-any-other-version) (May 15, 2015)
* [A new formatting plugin](https://github.com/diffplug/blog/tree/master/2015/a-new-formatting-plugin) (May 13, 2015)
* [All of heartbleed](https://github.com/diffplug/blog/tree/master/2014/all-of-heartbleed) (April 11, 2014)

<!---freshmark /toc -->

<!---freshmark follow
output = follow;
-->
[![Watch](https://img.shields.io/github/watchers/diffplug/blog.svg?style=social&label=Watch)](https://github.com/nedtwigg/blog/subscription)
[![Star](https://img.shields.io/github/stars/diffplug/blog.svg?style=social&label=Star)](https://github.com/nedtwigg/blog/stargazers)
[![Follow @NedTwigg](https://img.shields.io/twitter/follow/NedTwigg.svg?style=social&label=Follow)](https://twitter.com/NedTwigg)
[![Medium ned.twigg](https://img.shields.io/badge/Follow-41-blue.svg?style=social&logo=medium)](https://dev.to/nedtwigg)
[![dev.to nedtwigg](https://img.shields.io/badge/Follow-0-blue.svg?style=social&logo=dev.to)](https://dev.to/nedtwigg)
<!---freshmark /follow -->
