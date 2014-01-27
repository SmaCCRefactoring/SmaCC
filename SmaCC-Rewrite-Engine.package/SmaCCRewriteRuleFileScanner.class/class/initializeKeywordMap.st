generated
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(9 'Import' 3) #(9 'Parser' 2))
		do: [:each | (keywordMap at: each first ifAbsentPut: [Dictionary new]) at: (each at: 2) put: each last].
	^keywordMap