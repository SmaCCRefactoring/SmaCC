generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(30 'annotate_tokens' #(26 #(#directives))) #(30 'attributes' #(15 #(#directives))) #(30 'error' #(8 #(#default #directives #parser #scanner))) #(30 'excludes' #(12 #(#directives))) #(30 'glr' #(23 #(#directives))) #(30 'hierarchy' #(14 #(#directives))) #(30 'id' #(21 #(#directives))) #(30 'ignore_variables' #(25 #(#directives))) #(30 'ignorecase' #(24 #(#directives))) #(30 'left' #(18 #(#directives))) #(30 'nonassoc' #(20 #(#directives))) #(30 'parser' #(11 #(#directives))) #(30 'prefix' #(16 #(#directives))) #(30 'right' #(19 #(#directives))) #(30 'root' #(13 #(#directives))) #(30 'start' #(22 #(#directives))) #(30 'states' #(10 #(#directives))) #(30 'suffix' #(17 #(#directives))) #(30 'unicode' #(27 #(#directives))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap