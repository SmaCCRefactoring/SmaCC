Class {
	#name : #OMGScanner,
	#superclass : #SmaCCScanner,
	#category : 'SmaCC-IDL'
}

{ #category : #'generated-initialization' }
OMGScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(62 'FALSE' 10) #(62 'TRUE' 14) #(62 'any' 48) #(62 'attribute' 31) #(62 'boolean' 50) #(62 'case' 55) #(62 'char' 47) #(62 'const' 29) #(62 'context' 9) #(62 'default' 53) #(62 'double' 15) #(62 'enum' 54) #(62 'exception' 33) #(62 'float' 8) #(62 'in' 43) #(62 'inout' 38) #(62 'interface' 16) #(62 'long' 34) #(62 'module' 22) #(62 'octet' 45) #(62 'oneway' 35) #(62 'out' 39) #(62 'raises' 37) #(62 'readonly' 30) #(62 'sequence' 46) #(62 'short' 49) #(62 'string' 40) #(62 'struct' 52) #(62 'switch' 57) #(62 'typedef' 28) #(62 'union' 56) #(62 'unsigned' 51) #(62 'void' 41))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
OMGScanner >> emptySymbolTokenId [
	^ 148
]

{ #category : #generated }
OMGScanner >> errorTokenId [
	^ 149
]

{ #category : #generated }
OMGScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(61) ].
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
OMGScanner >> scan10 [
	[ self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scan2 [
	[ self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == Character cr
		ifTrue: [ self recordMatch: #(64).
			self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
OMGScanner >> scan3 [
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scan4 [
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	(currentCharacter between: $0 and: $7)
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scan5 [
	[ self recordMatch: #(59).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scan6 [
	self step.
	('+-' includes: currentCharacter)
		ifTrue: [ self step ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scan7 [
	[ self recordMatch: #(59).
	self step.
	currentCharacter isDigit ] whileTrue.
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scan8 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self scan8 ].
	true ] whileTrue
]

{ #category : #generated }
OMGScanner >> scan9 [
	self recordMatch: #(58).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(58).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan5 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan10 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan6 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(58) ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(58).
					self step.
					currentCharacter == $.
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ [ self step.
									('Pp' includes: currentCharacter)
										ifTrue: [ ^ self scan6 ].
									currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
							^ self reportLastMatch ].
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(58) ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForToken [
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self scanForTokenX11
]

{ #category : #generated }
OMGScanner >> scanForTokenX1 [
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
												ifTrue: [ ^ self scan3 ] ] ] ].
					^ self reportLastMatch ].
			(currentCharacter between: $0 and: $3)
				ifTrue: [ self step.
					currentCharacter == $'
						ifTrue: [ ^ self recordAndReportMatch: #(60) ].
					(currentCharacter between: $0 and: $7)
						ifTrue: [ ^ self scan4 ].
					^ self reportLastMatch ].
			(currentCharacter between: $4 and: $7)
				ifTrue: [ ^ self scan4 ].
			('"''\bfnrt' includes: currentCharacter)
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	(currentCharacter <= $&
		or: [ (currentCharacter between: $( and: $[)
				or: [ currentCharacter >= $] ] ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForTokenX10 [
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX5 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter == $$ ])
		ifTrue:
			[ self scanForTokenX3 ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForTokenX11 [
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $0
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	^ self scanForTokenX10
]

{ #category : #generated }
OMGScanner >> scanForTokenX2 [
	[ self recordMatch: #(58).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForTokenX3 [
	[ self recordMatch: #(62).
	self step.
	currentCharacter == $$
		or: [ (currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue
]

{ #category : #generated }
OMGScanner >> scanForTokenX4 [
	self recordMatch: #(2).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $/
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForTokenX5 [
	[ self recordMatch: #(63).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForTokenX6 [
	self recordMatch: #(42).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForTokenX7 [
	self recordMatch: #(44).
	self step.
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForTokenX8 [
	self recordMatch: #(19).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> scanForTokenX9 [
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
OMGScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace #comment)
]
