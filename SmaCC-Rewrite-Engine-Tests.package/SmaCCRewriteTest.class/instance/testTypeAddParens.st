tests
testTypeAddParens
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					SmaCCRewriteTestBinaryExpressionNode
					->
					>>>`(left)` `operator` `(right)`<<<').
	self
		compareRewrite: '1+(1+1)'
		isEqualTo: '(1) + ((1) + (1))'
		using: rewriter