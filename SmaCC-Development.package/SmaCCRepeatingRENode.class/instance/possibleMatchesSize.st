accessing
possibleMatchesSize
	"This does not return the exact number for expressions with over 50 potential matches since we don't need that detail and computing the exact value may be expensive."

	| baseSize |
	baseSize := node possibleMatchesSize.
	baseSize = 1
		ifTrue: [ ^ node possibleMatchesSize
				* (maximumMatches - minimumMatches + 1) ].
	maximumMatches >= 6
		ifTrue: [ ^ SmallInteger maxVal ].
	^ (minimumMatches to: maximumMatches)
		inject: 0
		into: [ :sum :each | sum + (baseSize raisedTo: each) ]