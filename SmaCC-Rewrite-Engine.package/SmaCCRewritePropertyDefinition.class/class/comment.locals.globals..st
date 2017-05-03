instance creation
comment: aString locals: localPropertyNames globals: globalPropertyNames
	^ self new
		comment: aString;
		addAllLocals: localPropertyNames;
		addAllGlobals: globalPropertyNames;
		yourself