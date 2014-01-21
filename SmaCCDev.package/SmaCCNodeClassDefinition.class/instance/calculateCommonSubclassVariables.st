private
calculateCommonSubclassVariables
	| allSubclassVars includedVariables |
	allSubclassVars := Bag new.
	subclasses do: [:each | allSubclassVars addAll: each variableDefinitions].
	includedVariables := allSubclassVars asSet select: [:each | (allSubclassVars occurrencesOf: each) = subclasses size].
	^self subclassProductionVariables select: [:each | includedVariables includes: each]