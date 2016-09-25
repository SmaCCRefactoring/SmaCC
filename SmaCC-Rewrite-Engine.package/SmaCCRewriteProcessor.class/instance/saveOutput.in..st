accessing
saveOutput: aString in: aFilename
	| stream directory |
	(aFilename isNil or: [ aFilename isEmpty ])
		ifTrue: [ ^ self ].
	aString isEmpty
		ifTrue: [ ^ self ].
	directory := aFilename asFileReference parent pathString.
	directory asFileReference exists
		ifFalse: [ directory asFileReference ensureCreateDirectory ].
	stream := FileStream forceNewFileNamed: aFilename.
	[ stream nextPutAll: aString ]
		ensure: [ stream close ]