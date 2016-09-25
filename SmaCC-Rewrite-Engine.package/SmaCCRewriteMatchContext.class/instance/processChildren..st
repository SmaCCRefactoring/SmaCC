processing
processChildren: aCollection
	aCollection do: [ :each | self processChild: each ]