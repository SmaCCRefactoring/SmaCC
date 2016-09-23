variables
indexOfVariable: aString
	self variableDefinitions
		keysAndValuesDo: [ :index :each | 
			each variableName = aString
				ifTrue: [ ^ index ] ].
	self error: 'Variable not found'