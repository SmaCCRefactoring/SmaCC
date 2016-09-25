accessing
relativeFilename
	| parentDirectory |
	parent isNil
		ifTrue: [ ^ filename ].
	parentDirectory := parent directory.
	^ (filename beginsWith: parentDirectory)
		ifTrue: [ filename
				copyFrom: parentDirectory size + 1
				to: filename size ]
		ifFalse: [ filename ]