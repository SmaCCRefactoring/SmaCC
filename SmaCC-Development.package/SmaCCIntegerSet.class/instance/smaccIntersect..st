enumerating
smaccIntersect: aCollection
	aCollection class == self class
		ifFalse: [ ^ super smaccIntersect: aCollection ].
	self normalize.
	aCollection normalize.
	(self == aCollection or: [ data == 0 or: [ aCollection data = 1 and: [ aCollection run >= run ] ] ])
		ifTrue: [ ^ self copy ].
	(aCollection data == 0 or: [ data = 1 and: [ run >= aCollection run ] ])
		ifTrue: [ ^ aCollection copy ].
	^ self copy privateIntersect: aCollection