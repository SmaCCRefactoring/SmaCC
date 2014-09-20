generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(259 '!invariant.load' 143) #(259 '!nontemporal' 123))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap