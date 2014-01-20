compiling-scanner
scannerActionFor: aString
	| selector |
	aString size > 2
		ifFalse: [ ^ nil ].
	selector := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	^ ((scannerClass definesMethod: selector)
		and: [ 
			(Object canUnderstand: selector) not
				and: [ 
					((SmaCCScanner canUnderstand: selector) not or: [ #(#comment #whitespace) includes: selector ])
						and: [ selector numArgs = 0 ] ] ])
		ifTrue: [ selector ]
		ifFalse: [ nil ]