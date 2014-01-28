public
localizeFilename: aString
	| newString |
	newString := (self remotePrefix notEmpty and: [ aString beginsWith: self remotePrefix ])
		ifTrue: [ self localPrefix , (aString copyFrom: self remotePrefix size + 1) ]
		ifFalse: [ aString ].
	^ (newString copyReplacing: $\ withObject: FileSystem workingDirectory delimiter)
		copyReplacing: $/
		withObject: FileSystem workingCopy delimiter