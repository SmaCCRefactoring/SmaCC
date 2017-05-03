generated
string: aDelphiExpressionNode
	self string notNil
		ifTrue: [ self string parent: nil ].
	string := aDelphiExpressionNode.
	self string notNil
		ifTrue: [ self string parent: self ]