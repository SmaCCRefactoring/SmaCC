updating
update: anAspectSymbol with: aParameter from: aSender
	(components includes: aSender)
		ifTrue: [ self addAll: aSender symbols ]