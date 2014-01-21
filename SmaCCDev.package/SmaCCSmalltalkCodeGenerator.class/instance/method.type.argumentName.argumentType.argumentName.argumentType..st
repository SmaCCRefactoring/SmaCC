code
method: aString type: anObject argumentName: firstArgumentNameString argumentType: firstArgumentTypeString argumentName: secondArgumentNameString argumentType: secondArgumentTypeString
	| keywords |
	keywords := aString asSymbol keywords.
	^keywords first , ' ' , firstArgumentNameString , ' ' , keywords last , ' '
		, secondArgumentNameString