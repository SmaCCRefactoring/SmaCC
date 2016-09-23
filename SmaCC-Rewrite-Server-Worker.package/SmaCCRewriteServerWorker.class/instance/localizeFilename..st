running
localizeFilename: aString
	| newString |
	newString := (self remotePrefix notEmpty and: [ aString beginsWith: self remotePrefix ])
		ifTrue:
			[ self localPrefix , (aString copyFrom: self remotePrefix size + 1 to: aString size) ]
		ifFalse: [ aString ].
	^ (newString copyReplaceAll: '\' with: FileSystem disk delimiter asString)
		copyReplaceAll: '/'
		with: FileSystem disk delimiter asString