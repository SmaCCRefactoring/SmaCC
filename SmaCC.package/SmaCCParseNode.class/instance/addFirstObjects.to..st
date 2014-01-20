collection
addFirstObjects: addCollection to: aCollection
	addCollection isNil
		ifTrue: [ ^ self ].
	addCollection reverseDo: [ :each | self addFirstObject: each to: aCollection ]