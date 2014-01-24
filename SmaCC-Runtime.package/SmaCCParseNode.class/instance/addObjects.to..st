collection
addObjects: addCollection to: aCollection
	addCollection isNil
		ifTrue: [ ^ self ].
	addCollection do: [ :each | self addObject: each to: aCollection ]