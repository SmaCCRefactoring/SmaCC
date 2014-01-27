private
testExpressions
	| stream coreExpression |
	stream := WriteStream on: String new.
	(1 to: 25) do: [:i | stream nextPutAll: '1 +'] separatedBy: [stream space].
	coreExpression := stream contents.
	self
		compareRewrite: coreExpression , ' 1'
		isEqualTo: '1 ' , coreExpression
		using: self postfixRewriter