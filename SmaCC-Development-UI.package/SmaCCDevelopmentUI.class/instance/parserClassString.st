accessing
parserClassString
	^ parserClassMorph
		ifNil: [ String empty ]
		ifNotNil: [ : pClassMorph | pClassMorph content ]