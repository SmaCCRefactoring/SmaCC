source editing
sourceFor: anObject
	anObject isNil
		ifTrue: [ ^ '' ].
	^ (self
		sourceFrom: (self startIndexFor: anObject)
		to: (self stopIndexFor: anObject)) asString