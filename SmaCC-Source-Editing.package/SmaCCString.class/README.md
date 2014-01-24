SmaCCString is a special string like object that makes rewriting source code faster. It supports operations to insert and delete text from the middle of strings more efficiently than constructing new strings.

Instance Variables:
	currentId	<Integer>	the id that is used when constructing new SmaCCIntervals
	firstSentinel	<SmaCCStringInterval>	the head of the SmaCCInterval list
	lastSentinel	<SmaCCStringInterval>	the tail of the SmaCCInterval list
	cachedInterval	<SmaCCStringInterval>	the interval where the last action took place -- most likely it or something nearby will the next thing needed

