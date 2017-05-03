generated
interfaceDcl: anASTInterfaceDclNode
	self interfaceDcl notNil
		ifTrue: [ self interfaceDcl parent: nil ].
	interfaceDcl := anASTInterfaceDclNode.
	self interfaceDcl notNil
		ifTrue: [ self interfaceDcl parent: self ]