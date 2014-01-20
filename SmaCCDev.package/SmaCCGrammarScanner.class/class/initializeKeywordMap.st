generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(20 'error' 15))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap