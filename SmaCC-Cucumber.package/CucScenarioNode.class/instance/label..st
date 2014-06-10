generated
label: aCucIdentifiersNode
	self label notNil
		ifTrue: [ self label parent: nil ].
	label := aCucIdentifiersNode.
	self label notNil
		ifTrue: [ self label parent: self ]