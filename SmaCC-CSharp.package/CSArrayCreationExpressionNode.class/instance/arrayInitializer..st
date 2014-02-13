generated
arrayInitializer: aCSArrayInitializerNode
	self arrayInitializer notNil
		ifTrue: [ self arrayInitializer parent: nil ].
	arrayInitializer := aCSArrayInitializerNode.
	self arrayInitializer notNil
		ifTrue: [ self arrayInitializer parent: self ]