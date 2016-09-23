generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(20 'false' 12) #(20 'nil' 14) #(20 'true' 11) #(26 '||' 15))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap