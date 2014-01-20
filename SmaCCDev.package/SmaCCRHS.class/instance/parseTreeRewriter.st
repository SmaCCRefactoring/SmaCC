reduction table
parseTreeRewriter
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	1 to: self size
		do: 
			[:i | 
			rewriter replace: i printString storeString
				with: '(nodes at: ' , i printString , ')'].
	variableNames keysAndValuesDo: 
			[:key :value | 
			rewriter replace: key with: '(nodes at: ' , value printString , ')'].
	^rewriter