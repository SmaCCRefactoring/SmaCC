variables
singularVariables
	^ self singularVariableSelectors
		inject: Set new
		into:
			[ :sum :each | 
			sum
				addAll: (self perform: each);
				yourself ]