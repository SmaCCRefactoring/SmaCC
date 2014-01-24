private
objectGetterForVariableName: aString
	self variableDefinitionInHierarchyNamed: aString do: [:var | var isCollection ifFalse: [^var getterMethodName asSymbol]].
	^nil