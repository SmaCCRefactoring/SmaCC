accessing
generateItemSetComments
	generateItemSetComments isNil
		ifTrue: [ generateItemSetComments := false ].
	^ generateItemSetComments