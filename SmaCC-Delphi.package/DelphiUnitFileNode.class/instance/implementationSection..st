generated
implementationSection: aDelphiImplementationSectionNode
	self implementationSection notNil
		ifTrue: [ self implementationSection parent: nil ].
	implementationSection := aDelphiImplementationSectionNode.
	self implementationSection notNil
		ifTrue: [ self implementationSection parent: self ]