generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(15 'false' 7) #(15 'nil' 6) #(15 'true' 5))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap