accessing
rootDefinition
	^classDefinitions detect: [:each | each isRoot] ifNone: [nil]