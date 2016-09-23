instance creation
on: aDebugSession
	| glrClass |
	glrClass := Smalltalk at: #SmaCCGLRParser ifAbsent: [ self ].
	^ self basicNew
		isGLR: (aDebugSession parser isKindOf: glrClass);
		initialize;
		session: aDebugSession