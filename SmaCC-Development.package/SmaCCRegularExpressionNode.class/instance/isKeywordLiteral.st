testing
isKeywordLiteral
	^ self possibleMatchesSize < 50
		and:
			[ self
				possibleMatchesDo: [ :each | 
					each size > 1
						ifTrue: [ ^ true ] ].
			false ]