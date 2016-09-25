generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(30 'annotate_tokens' #(27 #(#directives))) #(30 'attributes' #(16 #(#directives))) #(30 'error' #(10 #(#default #directives #parser #scanner))) #(30 'excludes' #(13 #(#directives))) #(30 'glr' #(24 #(#directives))) #(30 'hierarchy' #(15 #(#directives))) #(30 'id' #(22 #(#directives))) #(30 'ignore_variables' #(26 #(#directives))) #(30 'ignorecase' #(25 #(#directives))) #(30 'left' #(19 #(#directives))) #(30 'nonassoc' #(21 #(#directives))) #(30 'prefix' #(17 #(#directives))) #(30 'right' #(20 #(#directives))) #(30 'root' #(14 #(#directives))) #(30 'start' #(23 #(#directives))) #(30 'states' #(12 #(#directives))) #(30 'suffix' #(18 #(#directives))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap