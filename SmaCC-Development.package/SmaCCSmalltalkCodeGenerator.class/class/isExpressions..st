accessing
isExpressions: aCollection
	"Assign a collection of Character is___ selectors that can be used to create the scanner. These can make the generated scanners easier to read as a test like currentCharacter isAlphaNumeric is easier to read than a test of '(currentCharacter >= $A and: [currentCharacter <= $Z]) or: [(currentCharacter >= $a and: [currentCharacter <= $z]) or: [currentCharacter >= $0 and: [currentCharacter <= $9]]]'. If the collection is nil, SmaCC will automatically create the set of all is___ methods that are in the current image. This may result in a scanner that doesn't work in a different image. If you wish to limit the selectors that can be used, you can set them here:
	
	self isExpressions: #(isAlphaNumeric isDigit isLetter isLiteral isLowercase isSeparator isSpecial isUppercase isVowel)
	
	"

	IsExpressions := aCollection