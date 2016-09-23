generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(26 'annotate_tokens' #(23 #(#directives))) #(26 'attributes' #(12 #(#directives))) #(26 'error' #(4 #(#default #directives #parser #scanner))) #(26 'excludes' #(9 #(#directives))) #(26 'glr' #(20 #(#directives))) #(26 'hierarchy' #(11 #(#directives))) #(26 'id' #(18 #(#directives))) #(26 'ignore_variables' #(22 #(#directives))) #(26 'ignorecase' #(21 #(#directives))) #(26 'left' #(15 #(#directives))) #(26 'nonassoc' #(17 #(#directives))) #(26 'prefix' #(13 #(#directives))) #(26 'right' #(16 #(#directives))) #(26 'root' #(10 #(#directives))) #(26 'start' #(19 #(#directives))) #(26 'states' #(8 #(#directives))) #(26 'suffix' #(14 #(#directives))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap