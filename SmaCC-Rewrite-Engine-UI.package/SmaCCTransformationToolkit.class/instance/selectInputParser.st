actions
selectInputParser
	| class |
	class := UITheme builder chooseDropList: 'Select input parser class' list: self parserClasses.
	class isNil
		ifTrue: [ ^ self ].
	self model inputParserClass: class