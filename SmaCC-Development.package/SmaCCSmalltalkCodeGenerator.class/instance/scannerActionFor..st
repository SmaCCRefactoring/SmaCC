compiling
scannerActionFor: aString
	"Do not blindly match all methods of SmaCCScanner: the 'next' keyword bug :)"

	| selector current |
	aString size > 2
		ifFalse: [ ^ nil ].
	selector := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	selector numArgs = 0 ifFalse: [^nil].
	current := scannerClass.
"	[current notNil and: [current superclass notNil]] whileTrue: 
+			[(current directlyDefinesMethod: selector) ifTrue: [^selector].
+			current := current superclass]."
	^ (scannerClass notNil
		and: [ 
			selector isUnary
				and: [ 
					(Object canUnderstand: selector) not
						and: [ 
							(scannerClass directlyDefinesMethod: selector)
								or: [ 
									(scannerClass whoDefinesMethod: selector)
										ifNil: [ false ]
										ifNotNil: [ :aClass | 
											(aClass name == #SmaCCScanner and: [ #(#comment #whitespace #patternToken) includes: selector ])
												or: [ aClass name ~= #SmaCCScanner ] ] ] ] ] ])
		ifTrue: [ selector ]
		ifFalse: [ nil ]