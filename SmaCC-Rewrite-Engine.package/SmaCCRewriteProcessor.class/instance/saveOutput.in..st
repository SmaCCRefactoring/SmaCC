accessing
saveOutput: aString in: aFilename
	| directory fullFilename |
	(self outputDirectory isNil or: [ self outputDirectory isEmpty ])
		ifTrue: [ ^ self ].
	fullFilename := self outputDirectory / aFilename.
	directory := fullFilename parent.
	directory ensureDirectory.
	fullFilename writeStreamDo: [ :stream | stream nextPutAll: aString ]