private
basicModelTypesForVariable: aString into: productionTypes seen: aSet
	(self symbolForVariableName: aString) ifNotNil: [:symbol | productionTypes addAll: symbol modelTypes].
	self
		unnamedSymbolsDo:
			[:each | (each hasVariableNamed: aString) ifTrue: [productionTypes addAll: (each modelTypesForVariable: aString seen: aSet)]]