tests
testMultipleInsertAfters
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'SmaCCRewriteTestBinaryExpressionNode
					->
					[match parent notNil 
						ifTrue:
							[self insert: ''()'' after: match.
							self insert: ''[]'' after: match].
					self continue]').
	self compareRewrite: '1+1+1' isEqualTo: '1+1()[]+1' using: rewriter