accessing
validationParserClass: aSmaCCParserClass
	validationParserClass := aSmaCCParserClass.
	modified := true.
	self trigger: #validationParserClass with: aSmaCCParserClass