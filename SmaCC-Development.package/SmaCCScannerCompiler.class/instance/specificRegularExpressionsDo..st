regular expression construction
specificRegularExpressionsDo: aBlock
	self
		regularExpressionsDo: [ :each | 
			each isKeywordLiteral
				ifTrue: [ aBlock value: each ] ]