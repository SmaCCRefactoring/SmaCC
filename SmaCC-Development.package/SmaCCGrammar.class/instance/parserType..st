accessing
parserType: aSymbol
	SmaCCParser withAllSubclasses
		detect: [ :e | 
			(e class includesSelector: #parserType)
				and: [ e parserType == aSymbol ] ]
		ifNone: [ self error: aSymbol , ': Unknown parser type' ].
	parserType := aSymbol