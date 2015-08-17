private
calculateReduceActions
	variableSymbols do: [ :each | each productionsDo: [ :rhs | rhs reduceAction: (SmaCCVariableReduceCode onRHS: rhs) ] ].
	singleVariableSymbols
		do: [ :each | each productionsDo: [ :rhs | rhs reduceAction: (SmaCCSingleVariableReduceCode onRHS: rhs) ] ].
	grammar
		rhsDo: [ :each | 
			each hasNodeClassDefinition
				ifTrue: [ each reduceAction: (SmaCCCreateNodeReduceCode onRHS: each) ]
				ifFalse: [ 
					each hasReduceAction
						ifFalse: [ each reduceAction: (SmaCCDefaultNodeReduceCode onRHS: each) ] ] ]