tests
testCodeExpressionToRemoveParens
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a{testBlock: [:node | node leftParens notEmpty]}`<<<
					->
					>>>``match leftParens do: [:each | self delete: each].
							match rightParens do: [:each | self delete: each].
							match nodesDo: [:each | self rewrite: each]``<<<').
	self
		compareRewrite: '(1)+ ( 1 +(1))'
		isEqualTo: '1+  1 +1'
		using: rewriter