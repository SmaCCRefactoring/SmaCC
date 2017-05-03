generated
_class: aDelphiQualifiedNameNode
	self _class notNil
		ifTrue: [ self _class parent: nil ].
	_class := aDelphiQualifiedNameNode.
	self _class notNil
		ifTrue: [ self _class parent: self ]