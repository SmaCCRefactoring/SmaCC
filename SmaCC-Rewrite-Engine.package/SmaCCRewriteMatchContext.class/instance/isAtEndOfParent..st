testing
isAtEndOfParent: anObject
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				reverseDo: [ :each | ^ self isAtEndOfParent: each ] ].
	^ (anObject isKindOf: SmaCCParseNode)
		and:
			[ anObject parent notNil
				and: [ anObject parent stopPosition = anObject stopPosition ] ]