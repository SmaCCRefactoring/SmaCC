testing
isLetterOrDigit: each
	^ (each between: $a and: $z)
		or:
			[ (each between: $A and: $Z)
				or: [ (each between: $0 and: $9) or: [ each == $_ ] ] ]