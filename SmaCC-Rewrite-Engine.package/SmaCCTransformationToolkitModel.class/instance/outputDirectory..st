accessing
outputDirectory: aString
	outputDirectory := aString.
	modified := true.
	self changed: #outputDirectory with: aString