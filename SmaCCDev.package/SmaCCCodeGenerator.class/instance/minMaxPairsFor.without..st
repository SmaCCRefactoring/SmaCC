compiling
minMaxPairsFor: aSmaCCCharacterEdge without: isSelectors
	| start last pairs charsLeft |
	charsLeft := aSmaCCCharacterEdge transitionObjects reject: [:ch | isSelectors anySatisfy: [:each | ch perform: each]].
	pairs := OrderedCollection new.
	charsLeft isEmpty ifTrue: [^pairs].
	last := charsLeft first.
	start := nil.
	charsLeft
		do:
			[:each | 
			last asInteger + 1 = each asInteger
				ifFalse:
					[start notNil ifTrue: [pairs add: (Array with: start with: last)].
					start := each].
			last := each].
	pairs add: (Array with: start with: last).
	^pairs