reduction table
compileSourceFor: aSmaCCSymbol in: aClass 
	| action rewriter parseTree methodName |
	action := self reduceAction.
	action isNil ifTrue: [^self defaultReduceAction].
	parseTree := RBParser parseExpression: action
				onError: 
					[:s :p | 
					SmaCCCompilationNotification new
						tag: aSmaCCSymbol name , ' : ' , self printString 
								, '\\' withCRs , action;
						signal: 'Invalid Smalltalk code in reduction rule'.
					^self defaultReduceAction].
	(parseTree isLiteralNode and: 
			[parseTree value isSymbol and: 
					[parseTree value numArgs <= 1 and: [aClass definesMethod: parseTree value]]]) 
		ifTrue: [^parseTree value].
	rewriter := self parseTreeRewriter.
	rewriter executeTree: parseTree.
	parseTree := rewriter tree.
	methodName := ('reduceActionFor' , aSmaCCSymbol safeMethodName 
				, (aSmaCCSymbol positionOf: self) printString , ':') 
				asSymbol.
	parseTree isSequence 
		ifFalse: [parseTree := RBSequenceNode statements: (Array with: parseTree)].
	parseTree := RBMethodNode 
				selector: methodName
				arguments: (Array with: (RBVariableNode named: 'nodes'))
				body: parseTree.
	parseTree addReturn.
	aClass compile: parseTree formattedCode
		classified: 'generated-reduction actions'.
	^methodName