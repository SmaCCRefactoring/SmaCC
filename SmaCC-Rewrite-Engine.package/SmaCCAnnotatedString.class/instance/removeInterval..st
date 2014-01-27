public
removeInterval: startInterval
	| result |
	result := super removeInterval: startInterval.
	self addAnnotationTo: result.
	^result