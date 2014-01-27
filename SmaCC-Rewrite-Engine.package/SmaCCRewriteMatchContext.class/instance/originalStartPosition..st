accessing
originalStartPosition: anObject
	(anObject isKindOf: Collection) ifTrue: [anObject do: [:each | ^self originalStartPosition: each]].
	((anObject isKindOf: SmaCCParseNode) or: [anObject isKindOf: SmaCCToken]) ifTrue: [^anObject startPosition].
	^nil