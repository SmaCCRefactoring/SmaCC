private
isCollectionVariable: aVariableName
	| definition |
	definition := self variableDefinitionNamed: aVariableName.
	definition notNil ifTrue: [^definition isCollection].
	^superclass notNil and: [superclass isCollectionVariable: aVariableName]