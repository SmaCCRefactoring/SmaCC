code generation templates
doesNotUnderstand: failedMessage
	"Use the code templates to expand the string."

	^ (self class codeTemplates
		at: failedMessage selector
		ifAbsent: [ ^ super doesNotUnderstand: failedMessage ])
		expandMacrosWithArguments: failedMessage arguments