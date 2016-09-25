comparing
= anObject
	| myItems i |
	self class = anObject class
		ifFalse: [ ^ false ].
	(self start = anObject start and: [ self run = anObject run ])
		ifTrue: [ ^ self data = anObject data ].
	self first = anObject first
		ifFalse: [ ^ false ].
	myItems := OrderedCollection new.
	self do: [ :each | myItems add: each ].
	i := 1.
	anObject
		do:
			[ :each | 
			| current |
			i > myItems size
				ifTrue: [ ^ false ].
			current := myItems at: i.
			current < each
				ifTrue: [ ^ false ].
			current > each
				ifTrue: [ ^ false ].
			i := i + 1 ].
	^ true