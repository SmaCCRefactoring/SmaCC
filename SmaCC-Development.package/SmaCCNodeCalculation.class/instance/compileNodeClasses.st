private
compileNodeClasses
	self sortedClasses isEmpty
		ifTrue: [ ^ self ].
	self defineNodeClasses.
	self calculateVariableSymbols.
	self calculateReduceActions.
	self calculateVariables.
	self compileMethodsAndVariables.
	self compileVisitor.
	self compileTypes