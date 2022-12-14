Class {
	#name : #JSScanner,
	#superclass : #SmaCCScanner,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #'generated-initialization' }
JSScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(85 'break' 43) #(85 'case' 49) #(85 'catch' 60) #(85 'const' 74) #(85 'continue' 44) #(85 'debugger' 53) #(85 'default' 48) #(85 'delete' 32) #(85 'do' 58) #(85 'else' 26) #(85 'false' 12) #(85 'finally' 54) #(85 'for' 59) #(85 'function' 51) #(85 'get' 36) #(85 'if' 62) #(85 'in' 14) #(85 'instanceof' 20) #(85 'let' 75) #(85 'new' 34) #(85 'null' 52) #(85 'of' 50) #(85 'return' 41) #(85 'set' 37) #(85 'switch' 45) #(85 'this' 27) #(85 'throw' 56) #(85 'true' 55) #(85 'try' 57) #(85 'typeof' 19) #(85 'var' 71) #(85 'void' 35) #(85 'while' 46) #(85 'with' 42) #(84 'break' 43) #(84 'case' 49) #(84 'catch' 60) #(84 'const' 74) #(84 'continue' 44) #(84 'debugger' 53) #(84 'default' 48) #(84 'delete' 32) #(84 'do' 58) #(84 'else' 26) #(84 'false' 12) #(84 'finally' 54) #(84 'for' 59) #(84 'function' 51) #(84 'get' 36) #(84 'if' 62) #(84 'in' 14) #(84 'instanceof' 20) #(84 'let' 75) #(84 'new' 34) #(84 'null' 52) #(84 'of' 50) #(84 'return' 41) #(84 'set' 37) #(84 'switch' 45) #(84 'this' 27) #(84 'throw' 56) #(84 'true' 55) #(84 'try' 57) #(84 'typeof' 19) #(84 'var' 71) #(84 'void' 35) #(84 'while' 46) #(84 'with' 42))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
JSScanner >> emptySymbolTokenId [
	^ 182
]

{ #category : #generated }
JSScanner >> errorTokenId [
	^ 183
]

{ #category : #generated }
JSScanner >> identifierId [
	^ 84
]

{ #category : #generated }
JSScanner >> identifierNameId [
	^ 85
]

{ #category : #generated }
JSScanner >> regular_expressionId [
	^ 89
]

{ #category : #generated }
JSScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan3 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan10 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(88).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(88).
					self step.
					currentCharacter isDigit ] whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan11 [
	[ self step.
	currentCharacter == $/
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan15 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan16 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $.)
						or: [ (currentCharacter between: $0 and: $Z)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan12 [
	self recordMatch: #(89).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan14 ].
	(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
		ifTrue: [ ^ self scan13 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan13 [
	[ self recordMatch: #(89).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan14 ].
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan14 [
	self step.
	currentCharacter == $u
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self step.
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ ^ self scan13 ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan15 [
	[ self step.
	currentCharacter == $\
		ifTrue: [ self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ ^ self scan15 ].
			^ self reportLastMatch ].
	currentCharacter == $]
		ifTrue: [ ^ self scan11 ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan16 [
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan17 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(83) ].
			^ self scan17 ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan18 [
	[ self recordMatch: #(88).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan9 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan19 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(90).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan19 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan2 [
	self recordMatch: #(87).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan3 [
	self step.
	currentCharacter == Character cr
		ifTrue: [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan3 ].
			(currentCharacter <= Character newPage
				or: [ (currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[)
								or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	^ self scan1
]

{ #category : #generated }
JSScanner >> scan4 [
	[ self recordMatch: #(84 85).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan5 ].
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan5 [
	self step.
	currentCharacter == $u
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self step.
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ ^ self scan4 ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan6 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan8 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan7 [
	self recordMatch: #(87).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan8 [
	self step.
	currentCharacter == Character cr
		ifTrue: [ self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan8 ].
			(currentCharacter <= Character newPage
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan6 ].
			^ self reportLastMatch ].
	^ self scan6
]

{ #category : #generated }
JSScanner >> scan9 [
	[ self recordMatch: #(88).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX13 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX7 ].
	^ self scanForTokenX17
]

{ #category : #generated }
JSScanner >> scanForTokenX1 [
	self recordMatch: #(81).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan17 ].
	^ self scanForTokenX1X3
]

{ #category : #generated }
JSScanner >> scanForTokenX10 [
	self recordMatch: #(10).
	self step.
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(11).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(15) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX11 [
	self recordMatch: #(47).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(78) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX12 [
	self recordMatch: #(4).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(61) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX13 [
	self recordMatch: #(3).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(68) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX14 [
	self recordMatch: #(40).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX15 [
	[ self recordMatch: #(86).
	self step.
	currentCharacter isSeparator ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX16 [
	currentCharacter == $\
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan19 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(29) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan18 ].
	currentCharacter isSeparator
		ifTrue:
			[ ^ self scanForTokenX15 ].
	(currentCharacter isLetter
		or: [ currentCharacter isSafeForHTTP or: [ currentCharacter == $$ ] ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX17 [
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	^ self scanForTokenX16
]

{ #category : #generated }
JSScanner >> scanForTokenX1X1 [
	self recordMatch: #(82).
	self step.
	currentCharacter == $/
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan15 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan16 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $.)
						or: [ (currentCharacter between: $0 and: $Z)
								or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX1X2 [
	[ self recordMatch: #(83).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX1X3 [
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1X2 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX1X1 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan15 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan16 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $))
						or: [ (currentCharacter between: $+ and: $.)
								or: [ (currentCharacter between: $0 and: $<)
										or: [ (currentCharacter between: $> and: $Z)
												or: [ currentCharacter >= $] ] ] ] ] ] ])
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX2 [
	self recordMatch: #(88).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan9 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan18 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(88).
					self step.
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX3 [
	self recordMatch: #(8).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(2).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(76) ].
			currentCharacter == $>
				ifTrue: [ self recordMatch: #(5).
					self step.
					currentCharacter == $=
						ifTrue: [ ^ self recordAndReportMatch: #(77) ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX4 [
	self recordMatch: #(9).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(1).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(72) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX5 [
	self recordMatch: #(66).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(70) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX6 [
	self recordMatch: #(6).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(69) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX7 [
	self recordMatch: #(18).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX8 [
	self recordMatch: #(39).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(67) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX9 [
	self recordMatch: #(63).
	self step.
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(13).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(38) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> semicolonId [
	^ 80
]

{ #category : #generated }
JSScanner >> slashEqualId [
	^ 82
]

{ #category : #generated }
JSScanner >> slashId [
	^ 81
]

{ #category : #generated }
JSScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment nil nil #whitespace nil nil nil #patternToken)
]
