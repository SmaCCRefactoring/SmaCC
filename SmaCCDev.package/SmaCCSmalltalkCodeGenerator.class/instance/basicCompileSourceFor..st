public
basicCompileSourceFor: aSmaCCReduceAction
	| parseTree rewriter methodName existing |
	parseTree := RBParser parseExpression: aSmaCCReduceAction rhs reduceAction source.
	(parseTree isLiteralNode
		and: [ parseTree value isSymbol and: [ parseTree value numArgs <= 1 and: [ self parserClass definesMethod: parseTree value ] ] ])
		ifTrue: [ ^ parseTree value ].
	rewriter := self parseTreeRewriterFor: aSmaCCReduceAction rhs.
	rewriter executeTree: parseTree.
	parseTree := rewriter tree.
	methodName := ('reduceActionFor' , aSmaCCReduceAction symbol safeMethodName
		, (aSmaCCReduceAction symbol positionOf: aSmaCCReduceAction rhs) printString , ':') asSymbol.
	parseTree isSequence
		ifFalse: [ parseTree := RBSequenceNode statements: (Array with: parseTree) ].
	parseTree := RBMethodNode selector: methodName arguments: (Array with: (RBVariableNode named: 'nodes')) body: parseTree.
	parseTree addReturn.
	existing := self findExistingMethodFor: parseTree.
	existing notNil
		ifTrue: [ ^ existing ].
	self parserClass compile: parseTree formattedCode classified: 'generated-reduction actions'.
	^ methodName