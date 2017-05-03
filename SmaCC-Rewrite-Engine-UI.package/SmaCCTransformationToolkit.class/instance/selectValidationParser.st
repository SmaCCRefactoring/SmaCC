actions
selectValidationParser
	| class |
	class := UITheme builder chooseDropList: 'Select validation parser class' list: self parserClasses.
	class isNil
		ifTrue: [ ^ self ].
	self model validationParserClass: class