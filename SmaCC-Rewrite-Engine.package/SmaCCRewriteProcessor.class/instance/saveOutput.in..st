accessing
saveOutput: aString in: aFilename
	| directory |
	(aFilename isNil or: [ aFilename isEmpty ])
		ifTrue: [ ^ self ].
	directory := aFilename parent.
	directory ensureDirectory.
	aFilename writeStreamDo: [ :stream | stream nextPutAll: aString ]