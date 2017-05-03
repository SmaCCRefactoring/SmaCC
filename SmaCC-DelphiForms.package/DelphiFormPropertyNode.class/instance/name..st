generated
name: aDelphiFormQualifiedNameNode
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aDelphiFormQualifiedNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]