private
basicModelTypesForVariable: aString into: productionTypes seen: aSet
	(self symbolsForVariableName: aString)
		do: [ :symbol | 
			symbol returnsSingleVariable
				ifTrue: [ productionTypes addAll: (symbol modelTypesForVariable: symbol variableName) ]
				ifFalse: [ productionTypes addAll: symbol modelTypes ] ].
	self
		unnamedSymbolsDo: [ :each | 
			(each hasVariableNamed: aString)
				ifTrue: [ productionTypes addAll: (each modelTypesForVariable: aString seen: aSet) ] ]