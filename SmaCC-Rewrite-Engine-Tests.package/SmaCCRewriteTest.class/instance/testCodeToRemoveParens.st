private
testCodeToRemoveParens
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'SmaCCRewriteTestExpressionNode
					->
					[match leftParens do: [:each | self delete: each].
					self processChildren.
					match rightParens do: [:each | self delete: each]]').
	self
		compareRewrite: '(1)+ ( 1 +(1))'
		isEqualTo: '1+  1 +1'
		using: rewriter