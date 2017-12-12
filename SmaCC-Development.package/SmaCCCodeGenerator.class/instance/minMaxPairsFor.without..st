compiling-scanner
minMaxPairsFor: aSmaCCCharacterEdge without: isSelectors
	| start last pairs charsLeft |
	charsLeft := aSmaCCCharacterEdge transitionObjects.
	isSelectors notEmpty
		ifTrue: [ charsLeft := charsLeft copy.
			isSelectors do: [ :each | charsLeft smaccRemoveAll: (SmaCCGrammar isExpressionMap at: each) ] ].
	pairs := OrderedCollection new.
	charsLeft isEmpty
		ifTrue: [ ^ pairs ].
	last := charsLeft first.
	start := nil.
	charsLeft
		do: [ :each | 
			last asInteger + 1 = each asInteger
				ifFalse: [ start notNil
						ifTrue: [ pairs add: (Array with: start with: last) ].
					start := each ].
			last := each ].
	pairs add: (Array with: start with: last).
	^ pairs