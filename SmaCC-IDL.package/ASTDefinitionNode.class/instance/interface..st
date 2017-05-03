generated
interface: anASTInterfaceNode
	self interface notNil
		ifTrue: [ self interface parent: nil ].
	interface := anASTInterfaceNode.
	self interface notNil
		ifTrue: [ self interface parent: self ]