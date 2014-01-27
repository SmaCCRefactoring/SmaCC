private
lispRewriter
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a{testBlock: [:node | 
									| myParent grandParent | 
									myParent := node parent. 
									grandParent := myParent parent.
									myParent class = grandParent class and: [myParent operator = grandParent operator]]}`
								`op{beToken;testBlock: [:token | token value ~= ''^'']}` `b`<<<
					->
					>>>`a` `b`<<<

					>>>`a`^`b`<<<
					->
					>>>(expt `a` `b`)<<<

					>>>`a` `op{beToken}` `b`<<<
					->
					>>>(`op` `a` `b`)<<<').
	^rewriter