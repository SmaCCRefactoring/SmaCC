generated
signature: aCSExplicitAnonymousFunctionSignatureNode
	self signature notNil
		ifTrue: [ self signature parent: nil ].
	signature := aCSExplicitAnonymousFunctionSignatureNode.
	self signature notNil
		ifTrue: [ self signature parent: self ]