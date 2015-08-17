testing
returnsSingleVariable
	^ productions anySatisfy: [ :each | each returnsSingleVariable ]