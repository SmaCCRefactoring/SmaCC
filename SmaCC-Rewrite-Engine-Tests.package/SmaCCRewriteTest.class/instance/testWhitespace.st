tests
testWhitespace
	self
		compareRewrite:
			'1+
	2
	*3'
		isEqualTo:
			'1 
	2
	 3 * +'
		using: self whitespacePostfixRewriter