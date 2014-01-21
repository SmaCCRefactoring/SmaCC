compiling
scannerActionFor: aString
	| selector |
	aString size > 2 ifFalse: [^nil].
	selector := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	^(scannerClass notNil
		and:
			[(scannerClass definesMethod: selector) and: [(Object canUnderstand: selector) not and: [selector argumentCount = 0]]])
		ifTrue: [selector]
		ifFalse: [nil]