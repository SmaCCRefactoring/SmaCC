generated
constType: anASTConstTypeNode
	self constType notNil
		ifTrue: [ self constType parent: nil ].
	constType := anASTConstTypeNode.
	self constType notNil
		ifTrue: [ self constType parent: self ]