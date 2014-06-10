generated
title: aCucIdentifiersNode
	self title notNil
		ifTrue: [ self title parent: nil ].
	title := aCucIdentifiersNode.
	self title notNil
		ifTrue: [ self title parent: self ]