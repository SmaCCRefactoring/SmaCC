accessing
addActions: aCollection
	aCollection isNil
		ifTrue: [ ^ self ].
	action isNil
		ifTrue: [ ^ action := aCollection copy ].
	action isSymbol
		ifTrue: [ ^ self ].
	aCollection isSymbol
		ifTrue: [ ^ action := aCollection ].
	aCollection
		do: [ :each | 
			(action includes: each)
				ifFalse: [ action add: each ] ]