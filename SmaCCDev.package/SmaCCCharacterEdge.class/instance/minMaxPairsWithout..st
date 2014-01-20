compiling
minMaxPairsWithout: aSelector 
	"Converts a list of characters into a collection of pairs representing the minimum and maximum of each sequence.
	The list is first filtered to include only those characters that fail aSelector."

	| start last pairs charsLeft |
	charsLeft := aSelector isNil 
				ifTrue: [transitionObjects]
				ifFalse: [transitionObjects reject: [:ch | ch perform: aSelector]].
	pairs := OrderedCollection new.
	charsLeft isEmpty ifTrue: [^pairs].
	last := charsLeft first.
	start := nil.
	charsLeft do: 
			[:each | 
			last asInteger + 1 = each asInteger 
				ifFalse: 
					[start notNil ifTrue: [pairs add: (Array with: start with: last)].
					start := each].
			last := each].
	pairs add: (Array with: start with: last).
	^pairs