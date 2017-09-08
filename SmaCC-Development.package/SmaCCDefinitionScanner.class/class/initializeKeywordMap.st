generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(29 'annotate_tokens' #(25 #(#directives))) #(29 'attributes' #(14 #(#directives))) #(29 'error' #(7 #(#default #directives #parser #scanner))) #(29 'excludes' #(11 #(#directives))) #(29 'glr' #(22 #(#directives))) #(29 'hierarchy' #(13 #(#directives))) #(29 'id' #(20 #(#directives))) #(29 'ignore_variables' #(24 #(#directives))) #(29 'ignorecase' #(23 #(#directives))) #(29 'left' #(17 #(#directives))) #(29 'nonassoc' #(19 #(#directives))) #(29 'prefix' #(15 #(#directives))) #(29 'right' #(18 #(#directives))) #(29 'root' #(12 #(#directives))) #(29 'start' #(21 #(#directives))) #(29 'states' #(10 #(#directives))) #(29 'suffix' #(16 #(#directives))) #(29 'unicode' #(26 #(#directives))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap