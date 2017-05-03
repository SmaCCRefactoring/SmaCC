generated
left: aDelphiFormParseNode
	self left notNil
		ifTrue: [ self left parent: nil ].
	left := aDelphiFormParseNode.
	self left notNil
		ifTrue: [ self left parent: self ]