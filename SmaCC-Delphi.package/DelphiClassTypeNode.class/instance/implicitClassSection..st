generated
implicitClassSection: aDelphiImplicitClassSectionNode
	self implicitClassSection notNil
		ifTrue: [ self implicitClassSection parent: nil ].
	implicitClassSection := aDelphiImplicitClassSectionNode.
	self implicitClassSection notNil
		ifTrue: [ self implicitClassSection parent: self ]