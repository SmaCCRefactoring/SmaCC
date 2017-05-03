generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(13 'Import' 2) #(13 'Parser' 4))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap