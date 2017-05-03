generated
location: aDelphiQualifiedNameNode
	self location notNil
		ifTrue: [ self location parent: nil ].
	location := aDelphiQualifiedNameNode.
	self location notNil
		ifTrue: [ self location parent: self ]