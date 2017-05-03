generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(20 'END' 7) #(20 'FALSE' 19) #(20 'INHERITED' 3) #(20 'INLINE' 4) #(20 'ITEM' 13) #(20 'OBJECT' 8) #(20 'TRUE' 19))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap