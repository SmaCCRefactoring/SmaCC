testing
requiresNodeType
	self
		productionsDo: [ :each | 
			each hasNodeClassDefinition
				ifTrue: [ ^ true ] ].
	^ false