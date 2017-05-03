generated
exception: aDelphiQualifiedNameNode
	self exception notNil
		ifTrue: [ self exception parent: nil ].
	exception := aDelphiQualifiedNameNode.
	self exception notNil
		ifTrue: [ self exception parent: self ]