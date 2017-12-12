comparing
= anObject
	self class = anObject class
		ifFalse: [ ^ false ].
	self normalize.
	anObject normalize.
	^ self start = anObject start and: [ self run = anObject run and: [ self data = anObject data ] ]