private
postfixRewriter
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a` `op{beToken}` `b`<<<
					->
					>>>`a` `b` `op`<<<').
	^rewriter