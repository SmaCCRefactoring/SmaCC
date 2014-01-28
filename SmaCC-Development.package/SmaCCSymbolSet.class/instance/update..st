updating
update: aSender
	(components includes: aSender) ifTrue: [self addAll: aSender symbols]