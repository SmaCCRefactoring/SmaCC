testing
isAtStartOfParent: anObject
	(anObject isKindOf: Collection)
		ifTrue: [ anObject do: [ :each | ^ self isAtStartOfParent: each ] ].
	^ (anObject isKindOf: SmaCCParseNode)
		and:
			[ anObject parent notNil
				and: [ anObject parent startPosition = anObject startPosition ] ]