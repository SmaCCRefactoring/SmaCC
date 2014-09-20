generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(254 '!invariant.load' 154) #(254 '!nontemporal' 62))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap