collection handling
setParents: aCollection to: anObject
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | each parent: anObject ]