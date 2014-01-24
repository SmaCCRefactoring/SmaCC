private
compileNodeClasses
	classes := self sortedClasses.
	classes isEmpty ifTrue: [^self].
	self defineNodeClasses.
	self calculateSymbolVariables.
	self calculateReduceActions.
	self calculateVariables.
	self compileMethodsAndVariables.
	self compileVisitor.
	self compileTypes