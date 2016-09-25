tests
testLispExpressions
	self
		compareRewrite: '1+2*3^4+5'
		isEqualTo: '(+ 1 (* 2 (expt 3 4)) 5)'
		using: self lispRewriter