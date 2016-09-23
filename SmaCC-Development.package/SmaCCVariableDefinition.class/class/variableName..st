instance creation
variableName: aString
	^ self new
		variableName: aString;
		isCollection: false;
		yourself