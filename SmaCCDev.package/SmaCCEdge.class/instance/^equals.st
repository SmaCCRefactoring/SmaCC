comparing
= aSmaCCEdge 
	self class = aSmaCCEdge class ifFalse: [^false].
	^self to = aSmaCCEdge to and: [self transitionObjects = aSmaCCEdge transitionObjects]