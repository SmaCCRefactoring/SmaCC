private
generalRegularExpressionsDo: aBlock
	self regularExpressionsDo: [:each | each isKeywordLiteral ifFalse: [aBlock value: each]]