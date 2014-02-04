private
verifySyntax
	self verifyScanner
		ifFalse: [^ false].
	self verifyParser ifFalse: [^false].
	^ true