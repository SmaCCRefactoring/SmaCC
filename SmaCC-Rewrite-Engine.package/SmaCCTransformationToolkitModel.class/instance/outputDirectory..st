accessing
outputDirectory: aString
	outputDirectory := aString.
	modified := true.
	self trigger: #outputDirectory with: aString