private
stopIndexFor: anObject
	^((anObject isKindOf: SmaCCParseNode) or: [anObject isKindOf: SmaCCToken])
		ifTrue: [rewriteEngine stopPositionForNode: anObject]
		ifFalse: [anObject]