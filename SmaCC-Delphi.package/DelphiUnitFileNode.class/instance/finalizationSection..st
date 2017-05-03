generated
finalizationSection: aDelphiFinalizationSectionNode
	self finalizationSection notNil
		ifTrue: [ self finalizationSection parent: nil ].
	finalizationSection := aDelphiFinalizationSectionNode.
	self finalizationSection notNil
		ifTrue: [ self finalizationSection parent: self ]