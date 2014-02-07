generated
body: aJavaConstructorBodyNode
	self body notNil ifTrue: [self body parent: nil].
	body := aJavaConstructorBodyNode.
	self body notNil ifTrue: [self body parent: self]