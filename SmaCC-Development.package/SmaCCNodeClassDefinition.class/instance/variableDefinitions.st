accessing
variableDefinitions
	variables isNil
		ifTrue:
			[variables := productions isEmpty ifTrue: [self calculateCommonSubclassVariables] ifFalse: [self productionVariables].
			self removeDuplicateSubclassVariables.
			SmaCCVariableDefinition assignIndices: variables].
	^variables