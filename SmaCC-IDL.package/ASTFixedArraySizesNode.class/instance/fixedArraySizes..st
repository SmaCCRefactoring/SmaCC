generated
fixedArraySizes: anASTFixedArraySizesNode
	self fixedArraySizes notNil
		ifTrue: [ self fixedArraySizes parent: nil ].
	fixedArraySizes := anASTFixedArraySizesNode.
	self fixedArraySizes notNil
		ifTrue: [ self fixedArraySizes parent: self ]