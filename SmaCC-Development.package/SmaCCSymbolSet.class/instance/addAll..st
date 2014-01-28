accessing
addAll: aCollection
	| todo |
	todo := OrderedCollection with: self.
	[todo notEmpty]
		whileTrue:
			[| oldSize current |
			current := todo removeFirst.
			oldSize := current symbols size.
			current symbols addAll: aCollection.
			oldSize ~= current symbols size ifTrue: [todo addAll: current dependents]]