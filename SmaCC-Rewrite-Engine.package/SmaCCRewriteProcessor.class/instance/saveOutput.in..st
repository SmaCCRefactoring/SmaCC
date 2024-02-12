accessing
saveOutput: aString in: aFilename
	| directory |

	(aFilename isNil or: [ aFilename isEmpty ])
		ifTrue: [ ^ self ].
	aString isEmpty
		ifTrue: [ ^ self ].
	directory := aFilename asFileReference parent pathString.
	directory asFileReference exists
		ifFalse: [ directory asFileReference ensureCreateDirectory ].
	aFilename asFileReference writeStreamDo: [ : stream |
		stream nextPutAll: aString ]