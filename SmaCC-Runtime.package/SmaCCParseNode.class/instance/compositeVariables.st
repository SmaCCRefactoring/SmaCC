variables
compositeVariables
	^ self compositeVariableSelectors
		inject: Set new
		into:
			[ :sum :each | 
			sum
				addAll: (self perform: each);
				yourself ]