generated
funcdef: aPyFuncdefNode
	self funcdef notNil
		ifTrue: [ self funcdef parent: nil ].
	funcdef := aPyFuncdefNode.
	self funcdef notNil
		ifTrue: [ self funcdef parent: self ]