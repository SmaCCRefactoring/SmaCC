instance creation
withAll: aCollection
	self == aCollection class
		ifTrue: [ ^ aCollection copy ].
	^ super withAll: aCollection