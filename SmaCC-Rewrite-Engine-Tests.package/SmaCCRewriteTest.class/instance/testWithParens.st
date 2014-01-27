private
testWithParens
	self
		compareRewrite: '1+(2+3)'
		isEqualTo: '1 2 3 + +'
		using: self postfixRewriter