accessing
keywordMap
	keywordMap isNil
		ifTrue: [ self initializeKeywordMap ].
	^ keywordMap