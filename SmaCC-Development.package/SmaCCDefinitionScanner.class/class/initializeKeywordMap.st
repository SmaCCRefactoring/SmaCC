generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(28 'annotate_tokens' #(25 #(#directives))) #(28 'attributes' #(14 #(#directives))) #(28 'error' #(7 #(#default #directives #parser #scanner))) #(28 'excludes' #(11 #(#directives))) #(28 'glr' #(22 #(#directives))) #(28 'hierarchy' #(13 #(#directives))) #(28 'id' #(20 #(#directives))) #(28 'ignore_variables' #(24 #(#directives))) #(28 'ignorecase' #(23 #(#directives))) #(28 'left' #(17 #(#directives))) #(28 'nonassoc' #(19 #(#directives))) #(28 'prefix' #(15 #(#directives))) #(28 'right' #(18 #(#directives))) #(28 'root' #(12 #(#directives))) #(28 'start' #(21 #(#directives))) #(28 'states' #(10 #(#directives))) #(28 'suffix' #(16 #(#directives))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap