accessing
asString
	(self isRemoved or: [self isEmpty]) ifTrue: [^''].
	^string copyFrom: start to: stop