private
accept: anObject
	(anObject isKindOf: SmaCCParseNode) ifTrue: [^self acceptNode: anObject].
	(anObject isKindOf: Collection) ifTrue: [^self acceptNodes: anObject].
	^anObject