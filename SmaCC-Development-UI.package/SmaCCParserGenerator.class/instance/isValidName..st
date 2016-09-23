private
isValidName: aString
	^ aString first isUppercase and: [ RBScanner isVariable: aString ]