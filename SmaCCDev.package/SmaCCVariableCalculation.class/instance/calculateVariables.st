initialize
calculateVariables
	self rhsDo: [:each | self addRHS: each].
	[todo notEmpty] whileTrue: [self calculateVariablesFor: todo removeFirst]