Class {
	#name : #JavaScanner,
	#superclass : #SmaCCScanner,
	#category : 'SmaCC-Java'
}

{ #category : #'generated-initialization' }
JavaScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(105 'abstract' 37) #(105 'assert' 83) #(105 'boolean' 32) #(105 'break' 82) #(105 'byte' 33) #(105 'case' 58) #(105 'catch' 75) #(105 'char' 25) #(105 'class' 8) #(105 'continue' 77) #(105 'default' 14) #(105 'do' 80) #(105 'double' 27) #(105 'else' 31) #(105 'enum' 13) #(105 'extends' 9) #(105 'false' 101) #(105 'final' 38) #(105 'finally' 76) #(105 'float' 26) #(105 'for' 81) #(105 'if' 16) #(105 'implements' 10) #(105 'import' 43) #(105 'instanceof' 57) #(105 'int' 29) #(105 'interface' 18) #(105 'long' 30) #(105 'native' 39) #(105 'new' 92) #(105 'null' 104) #(105 'package' 35) #(105 'private' 41) #(105 'protected' 46) #(105 'public' 45) #(105 'return' 78) #(105 'short' 34) #(105 'static' 42) #(105 'strictfp' 7) #(105 'super' 17) #(105 'switch' 47) #(105 'synchronized' 40) #(105 'this' 22) #(105 'throw' 84) #(105 'throws' 21) #(105 'transient' 23) #(105 'true' 101) #(105 'try' 74) #(105 'void' 11) #(105 'volatile' 24) #(105 'while' 79))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
JavaScanner >> GREATER_THANId [
	^ 96
]

{ #category : #generated }
JavaScanner >> SIGNED_RIGHT_SHIFTId [
	^ 97
]

{ #category : #generated }
JavaScanner >> UNSIGNED_RIGHT_SHIFTId [
	^ 98
]

{ #category : #generated }
JavaScanner >> emptySymbolTokenId [
	^ 316
]

{ #category : #generated }
JavaScanner >> errorTokenId [
	^ 317
]

{ #category : #generated }
JavaScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(103) ].
	currentCharacter == $\
		ifTrue: [ self step.
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
												ifTrue: [ ^ self scan1 ] ] ] ].
					^ self reportLastMatch ].
			(('"''' includes: currentCharacter)
				or: [ (currentCharacter between: $0 and: $7)
						or: [ '\bfnrt' includes: currentCharacter ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
JavaScanner >> scan10 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(108).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
JavaScanner >> scan2 [
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(102) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan3 [
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(102) ].
	(currentCharacter between: $0 and: $7)
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan4 [
	[ self recordMatch: #(100).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan5 [
	self step.
	('+-' includes: currentCharacter)
		ifTrue: [ self step ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan6 [
	[ self recordMatch: #(100).
	self step.
	currentCharacter isDigit ] whileTrue.
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan7 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(107) ].
			^ self scan7 ].
	true ] whileTrue
]

{ #category : #generated }
JavaScanner >> scan8 [
	self recordMatch: #(99).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan4 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan9 ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(99).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan4 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan9 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(99) ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(100) ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(99) ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(99).
					self step.
					currentCharacter == $.
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ [ self step.
									('Pp' includes: currentCharacter)
										ifTrue: [ ^ self scan5 ].
									currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
							^ self reportLastMatch ].
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(99) ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan9 [
	[ self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan4 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX17 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX16 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX15 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self scanForTokenX20
]

{ #category : #generated }
JavaScanner >> scanForTokenX1 [
	self step.
	currentCharacter == $\
		ifTrue: [ self step.
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
												ifTrue: [ ^ self scan2 ] ] ] ].
					^ self reportLastMatch ].
			(currentCharacter between: $0 and: $3)
				ifTrue: [ self step.
					currentCharacter == $'
						ifTrue: [ ^ self recordAndReportMatch: #(102) ].
					(currentCharacter between: $0 and: $7)
						ifTrue: [ ^ self scan3 ].
					^ self reportLastMatch ].
			(currentCharacter between: $4 and: $7)
				ifTrue: [ ^ self scan3 ].
			('"''\bfnrt' includes: currentCharacter)
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	(currentCharacter <= $&
		or: [ (currentCharacter between: $( and: $[)
				or: [ currentCharacter >= $] ] ])
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX10 [
	self recordMatch: #(54).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(51) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX11 [
	[ self recordMatch: #(106).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX12 [
	self recordMatch: #(49).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(63) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX13 [
	self recordMatch: #(2).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(71) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX14 [
	self recordMatch: #(15).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(93) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX15 [
	self recordMatch: #(44).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX16 [
	self recordMatch: #(89).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(68) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX17 [
	self recordMatch: #(86).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(53) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX18 [
	[ self recordMatch: #(105).
	self step.
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue
]

{ #category : #generated }
JavaScanner >> scanForTokenX19 [
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan10 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(85) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX3 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX11 ].
	(currentCharacter isLetter
		or: [ currentCharacter isSafeForHTTP or: [ currentCharacter == $$ ] ])
		ifTrue:
			[ self scanForTokenX18 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX2 [
	self recordMatch: #(87).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(107).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(67) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX20 [
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $0
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX13 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(48) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self scanForTokenX19
]

{ #category : #generated }
JavaScanner >> scanForTokenX3 [
	[ self recordMatch: #(99).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan4 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(99) ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX4 [
	self recordMatch: #(96).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(56) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(97).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(66) ].
			currentCharacter == $>
				ifTrue: [ self recordMatch: #(98).
					self step.
					currentCharacter == $=
						ifTrue: [ ^ self recordAndReportMatch: #(61) ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX5 [
	self recordMatch: #(90).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(70) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(88) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX6 [
	self recordMatch: #(72).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(73).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(65) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX7 [
	self recordMatch: #(50).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX8 [
	self recordMatch: #(28).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(20) ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX9 [
	self recordMatch: #(91).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(95) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(69) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace #comment #patternToken)
]
