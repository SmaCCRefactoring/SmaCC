private
recursionIndexFor: aSmaCCRHS
	| vars index recursionIndex |
	index := 1.
	recursionIndex := 0.
	vars := aSmaCCRHS productionSymbol variableDefinitions.
	aSmaCCRHS do: 
			[:each |
			(each returnsVariableCollection and: 
					[| rhsVars |
					rhsVars := each variableDefinitions.
					rhsVars size = vars size and: 
							[(1 to: rhsVars size) allSatisfy: 
									[:i |
									| var otherVar |
									var := rhsVars at: i.
									otherVar := vars at: i.
									var variableName = otherVar variableName
										and: [var isCollection = otherVar isCollection]]]])
				ifTrue: [recursionIndex := index].
			index := index + 1].
	^recursionIndex