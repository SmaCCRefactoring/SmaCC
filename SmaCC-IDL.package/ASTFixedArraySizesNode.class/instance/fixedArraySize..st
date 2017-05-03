generated
fixedArraySize: anASTFixedArraySizeNode
	self fixedArraySize notNil
		ifTrue: [ self fixedArraySize parent: nil ].
	fixedArraySize := anASTFixedArraySizeNode.
	self fixedArraySize notNil
		ifTrue: [ self fixedArraySize parent: self ]