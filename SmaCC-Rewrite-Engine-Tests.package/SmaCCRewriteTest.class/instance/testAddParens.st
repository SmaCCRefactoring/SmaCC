private
testAddParens
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a` `op{beToken}` `b`<<<
					->
					>>>`(a)` `op` `(b)`<<<').
	self
		compareRewrite: '1+(1+1)'
		isEqualTo: '(1) + ((1) + (1))'
		using: rewriter