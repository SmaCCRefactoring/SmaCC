generated
interfaceSection: aDelphiInterfaceSectionNode
	self interfaceSection notNil
		ifTrue: [ self interfaceSection parent: nil ].
	interfaceSection := aDelphiInterfaceSectionNode.
	self interfaceSection notNil
		ifTrue: [ self interfaceSection parent: self ]