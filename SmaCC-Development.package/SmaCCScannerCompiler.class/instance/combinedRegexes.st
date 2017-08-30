regular expression construction
combinedRegexes
	| combinedRegex |
	combinedRegex := nil.
	self
		regularExpressionsDo:
			[ :each | 
			combinedRegex := combinedRegex isNil
				ifTrue: [ each ]
				ifFalse: [ combinedRegex | each ] ].
	^ combinedRegex