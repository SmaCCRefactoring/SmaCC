private
collectionGetterForVariableName: aString
	self variableDefinitionInHierarchyNamed: aString do: [:var | var isCollection ifTrue: [^var getterMethodName asSymbol]].
	^nil