generated
initializationSection: aDelphiInitializationSectionNode
	self initializationSection notNil
		ifTrue: [ self initializationSection parent: nil ].
	initializationSection := aDelphiInitializationSectionNode.
	self initializationSection notNil
		ifTrue: [ self initializationSection parent: self ]