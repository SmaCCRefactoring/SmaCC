activation
activate
	self arguments size = 1
		ifTrue: [ ^ self runFile: self arguments first ].
	self exitFailure: 'Please provide rewrite file to run.'