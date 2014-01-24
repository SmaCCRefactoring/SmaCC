private
compileSourceFor: aSmaCCReduceAction
	^reduceActionCache at: aSmaCCReduceAction ifAbsentPut: [self basicCompileSourceFor: aSmaCCReduceAction]