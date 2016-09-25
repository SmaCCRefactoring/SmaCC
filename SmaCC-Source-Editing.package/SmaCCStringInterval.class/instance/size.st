accessing
size
	self isRemoved
		ifTrue: [ ^ 0 ].
	^ stop - start + 1 max: 0