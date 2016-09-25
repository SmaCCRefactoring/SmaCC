building
tokenIntervalFor: anObject
	(anObject isKindOf: SmaCCToken)
		ifTrue: [ (anObject startPosition notNil and: [ anObject startPosition > 0 ])
				ifTrue: [ ^ anObject startPosition to: anObject stopPosition ] ].
	(anObject isKindOf: SmaCCParseNode)
		ifTrue: [ | start end tokens |
			start := SmallInteger maxVal.
			end := 0.
			tokens := OrderedCollection new.
			anObject allTokensInto: tokens.
			tokens
				do: [ :each | 
					(each startPosition notNil and: [ each startPosition > 0 ])
						ifTrue: [ start := start min: each startPosition.
							end := end max: each stopPosition ] ].
			start <= end
				ifTrue: [ ^ start to: end ] ].
	^ nil