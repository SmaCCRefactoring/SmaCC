generated
from: aPyDotoptDottedNameNode
	self from notNil
		ifTrue: [ self from parent: nil ].
	from := aPyDotoptDottedNameNode.
	self from notNil
		ifTrue: [ self from parent: self ]