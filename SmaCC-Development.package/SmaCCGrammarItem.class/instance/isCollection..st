variables
isCollection: aString
	^ self collectionVariableDefinitions
		anySatisfy: [ :each | each variableName = aString ]