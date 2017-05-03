generated
typeParameters: aCSVariantTypeParameterListNode
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aCSVariantTypeParameterListNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]