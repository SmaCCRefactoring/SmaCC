private
parseTreeRewriterFor: aSmaCCRHS
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	1 to: aSmaCCRHS size do: [ :i | 
		rewriter replace: i printString storeString with: '(nodes at: ' , i printString , ')'.
		(aSmaCCRHS variableNameForIndex: i)
			ifNotNil: [ :name | rewriter replace: name with: '(nodes at: ' , i printString , ')' ] ].
	^ rewriter