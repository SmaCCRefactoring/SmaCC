generated
interfaceBody: anASTInterfaceBodyNode
	self interfaceBody notNil
		ifTrue: [ self interfaceBody parent: nil ].
	interfaceBody := anASTInterfaceBodyNode.
	self interfaceBody notNil
		ifTrue: [ self interfaceBody parent: self ]