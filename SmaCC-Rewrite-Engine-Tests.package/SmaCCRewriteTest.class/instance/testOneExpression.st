tests
testOneExpression
	self
		compareRewrite: '2+3'
		isEqualTo: '2 3 +'
		using: self postfixRewriter