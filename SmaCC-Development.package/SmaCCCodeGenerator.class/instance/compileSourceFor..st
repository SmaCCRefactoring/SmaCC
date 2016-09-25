reduction table
compileSourceFor: aSmaCCReduceAction
	^ reduceActionCache
		at: aSmaCCReduceAction
		ifAbsentPut: [ self basicCompileSourceFor: aSmaCCReduceAction ]