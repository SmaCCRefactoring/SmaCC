private
originalStartIndexFor: anObject
	^((anObject isKindOf: SmaCCParseNode) or: [anObject isKindOf: SmaCCToken])
		ifTrue: [anObject startPosition]
		ifFalse: [anObject]