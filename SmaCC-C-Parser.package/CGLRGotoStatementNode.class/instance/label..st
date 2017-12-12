generated
label: aCGLRIdentifierNode
	self label notNil
		ifTrue: [ self label parent: nil ].
	label := aCGLRIdentifierNode.
	self label notNil
		ifTrue: [ self label parent: self ]