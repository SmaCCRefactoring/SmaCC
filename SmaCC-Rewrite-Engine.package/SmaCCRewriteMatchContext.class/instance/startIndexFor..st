source editing
startIndexFor: anObject
	^ ((anObject isKindOf: SmaCCParseNode)
		or: [ anObject isKindOf: SmaCCToken ])
		ifTrue: [ rewriteEngine startPositionForNode: anObject ]
		ifFalse: [ anObject ]