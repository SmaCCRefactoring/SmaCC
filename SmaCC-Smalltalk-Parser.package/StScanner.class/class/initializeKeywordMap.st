generated
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(26 '||' 12) #(20 'false' 13) #(20 'nil' 10) #(20 'true' 11))
		do: [:each | (keywordMap at: each first ifAbsentPut: [Dictionary new]) at: (each at: 2) put: each last].
	^keywordMap