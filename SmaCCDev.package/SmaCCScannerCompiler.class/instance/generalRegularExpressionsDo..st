regular expression construction
generalRegularExpressionsDo: aBlock 
	self 
		regularExpressionsDo: [:each | each isKeywordLiteral ifFalse: [aBlock value: each]]