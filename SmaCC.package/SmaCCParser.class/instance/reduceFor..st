private
reduceFor: aCollection
	| newCollection item |
	(aCollection allSatisfy: [:each | each class ~~ OrderedCollection]) ifTrue: [^aCollection asOrderedCollection].
	aCollection first class == OrderedCollection
		ifTrue:
			[newCollection := aCollection first.
			2
				to: aCollection size
				do:
					[:i | 
					item := aCollection at: i.
					item class == OrderedCollection ifTrue: [newCollection addAll: item] ifFalse: [newCollection add: item]].
			^newCollection].
	newCollection := OrderedCollection new.
	aCollection
		do: [:each | each class == OrderedCollection ifTrue: [newCollection addAll: each] ifFalse: [newCollection add: each]].
	^newCollection