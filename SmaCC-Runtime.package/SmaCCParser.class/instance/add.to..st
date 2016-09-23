private
add: anObject to: aCollection
	anObject isNil
		ifTrue: [ ^ self ].
	aCollection add: anObject