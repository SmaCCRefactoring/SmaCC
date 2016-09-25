copying
postCopy
	super postCopy.
	attributes notNil
		ifTrue: [ attributes := attributes copy ]