generated
description: aCucIdentifiersNode
	self description notNil
		ifTrue: [ self description parent: nil ].
	description := aCucIdentifiersNode.
	self description notNil
		ifTrue: [ self description parent: self ]