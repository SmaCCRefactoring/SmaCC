scanning
variableAssignment
	| token |
	outputStream skip: -2.
	stream skip: -2.
	matchActions := Array with: self nameId.
	token := self createTokenFor: outputStream contents.
	outputStream reset.
	^token