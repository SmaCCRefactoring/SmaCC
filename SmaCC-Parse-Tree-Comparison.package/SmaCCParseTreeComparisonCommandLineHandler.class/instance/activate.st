public
activate
	self arguments size ~= 2
		ifTrue: [ self exitFailure: 'Please supply two filenames to compare' ].
	self compareFile: self arguments first to: self arguments last