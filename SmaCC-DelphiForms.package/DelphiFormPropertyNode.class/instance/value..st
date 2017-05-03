generated
value: aDelphiFormParseNode
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aDelphiFormParseNode.
	self value notNil
		ifTrue: [ self value parent: self ]