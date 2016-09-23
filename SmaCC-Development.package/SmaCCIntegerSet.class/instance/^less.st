comparing
< aSmaCCIntegerCollection
	| myItems i |
	self first < aSmaCCIntegerCollection first
		ifTrue: [ ^ true ].
	self first > aSmaCCIntegerCollection first
		ifTrue: [ ^ false ].
	myItems := OrderedCollection new.
	self do: [ :each | myItems add: each ].
	i := 1.
	aSmaCCIntegerCollection
		do:
			[ :each | 
			| current |
			i > myItems size
				ifTrue: [ ^ true ].
			current := myItems at: i.
			current < each
				ifTrue: [ ^ true ].
			current > each
				ifTrue: [ ^ false ].
			i := i + 1 ].
	^ false