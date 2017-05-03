generated
interfaceHeader: anASTInterfaceHeaderNode
	self interfaceHeader notNil
		ifTrue: [ self interfaceHeader parent: nil ].
	interfaceHeader := anASTInterfaceHeaderNode.
	self interfaceHeader notNil
		ifTrue: [ self interfaceHeader parent: self ]