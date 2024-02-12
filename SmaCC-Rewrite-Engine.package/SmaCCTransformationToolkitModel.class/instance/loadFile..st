actions
loadFile: aString

	aString asFileReference readStreamDo: [ : stream |
		self class compiler 
			source: stream contents 
			evaluate.
		self isModified: false ].