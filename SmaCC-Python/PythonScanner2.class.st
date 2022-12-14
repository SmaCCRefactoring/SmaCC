Class {
	#name : #PythonScanner2,
	#superclass : #SmaCCScanner,
	#instVars : [
		'lineJoiningStack',
		'indentStack',
		'tokenStack',
		'lastLineStart'
	],
	#category : 'SmaCC-Python'
}

{ #category : #'generated-initialization' }
PythonScanner2 class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(71 'and' 66) #(71 'as' 10) #(71 'assert' 39) #(71 'break' 7) #(71 'class' 47) #(71 'continue' 8) #(71 'def' 24) #(71 'del' 1) #(71 'elif' 60) #(71 'else' 57) #(71 'except' 69) #(71 'exec' 18) #(71 'finally' 61) #(71 'for' 55) #(71 'from' 12) #(71 'global' 11) #(71 'if' 59) #(71 'import' 15) #(71 'in' 36) #(71 'is' 52) #(71 'lambda' 68) #(71 'not' 65) #(71 'or' 70) #(71 'pass' 2) #(71 'print' 3) #(71 'raise' 14) #(71 'return' 17) #(71 'try' 56) #(71 'while' 62) #(71 'with' 63) #(71 'yield' 13))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
PythonScanner2 >> DEDENTId [
	^ 201
]

{ #category : #generated }
PythonScanner2 >> INDENTId [
	^ 202
]

{ #category : #private }
PythonScanner2 >> NEWLINE [
	"Handle the newline, depending on the mode. Line joining and non-joining is not working in the scanner as I expected, but this may be for the best."

	self lineJoiningStack == 0
		ifTrue: [ 
			matchActions := Array with: self NEWLINEId.
			self state: #lineBegin.
			lastLineStart := self position.
			^ self createTokenFor: '' ]
		ifFalse: [ ^ self whitespace ]
]

{ #category : #generated }
PythonScanner2 >> NEWLINEId [
	^ 80
]

{ #category : #private }
PythonScanner2 >> blankLine [
	"A blank line is ignored. However, if it contains comments, we need to recover them."

	lastLineStart := self position.
	(outputStream contents indexOf: $# ifAbsent: [  ])
		ifNotNil: [ :i | comments add: (Array with: start + i with: matchEnd) ].
	^ self whitespace
]

{ #category : #private }
PythonScanner2 >> emptyLine [
	"An empty line is also ignored in fact."

	lastLineStart := self position.
	^ self whitespace
]

{ #category : #generated }
PythonScanner2 >> emptySymbolTokenId [
	^ 196
]

{ #category : #generated }
PythonScanner2 >> errorTokenId [
	^ 197
]

{ #category : #private }
PythonScanner2 >> indent [
	"Here we should generate the IDENT and DEDENT tokens"

	| string count |
	self state: #default.
	string := outputStream contents.
	count := 0.
	string
		do: [ :each | 
			each = Character newPage
				ifTrue: [ count := 0 ].
			each = Character space
				ifTrue: [ count := count + 1 ].
			each = Character tab
				ifTrue: [ count := (count // 8 + 1) * 8 ] ].
	count = 0
		ifTrue: [ ^ super whitespace ].
	count > self indentStack last
		ifTrue: [ 
			self indentStack add: count.
			matchActions := Array with: self INDENTId.
			^ self createTokenFor: '' ].
	[ count < self indentStack last ]
		whileTrue: [ 
			matchActions := Array with: self DEDENTId.
			self tokenStack add: (self createTokenFor: '').
			self indentStack removeLast ].
	count = self indentStack last
		ifFalse: [ ^ self scannerError ].	"A bit crude, but shows an indentation error."
	^ self next
]

{ #category : #accessing }
PythonScanner2 >> indentStack [
	^ indentStack ifNil: [ indentStack := OrderedCollection with: 0 ]
]

{ #category : #initialize }
PythonScanner2 >> initialize [
	super initialize.
	state := #lineBegin
]

{ #category : #accessing }
PythonScanner2 >> lasLineStart [
	^ lastLineStart ifNil: [ lastLineStart := 1 ]
]

{ #category : #private }
PythonScanner2 >> lbrack [
	"start of line joining mode"

	self lineJoiningStack: self lineJoiningStack + 1.
	matchActions := Array with: self lbrackId.
	^ self createTokenFor: '['
]

{ #category : #generated }
PythonScanner2 >> lbrackId [
	^ 83
]

{ #category : #private }
PythonScanner2 >> lcurly [
	"start of line joining mode"

	self lineJoiningStack: self lineJoiningStack + 1.
	matchActions := Array with: self lcurlyId.
	^ self createTokenFor: '{'
]

{ #category : #generated }
PythonScanner2 >> lcurlyId [
	^ 85
]

{ #category : #accessing }
PythonScanner2 >> lineJoiningStack [
	^ lineJoiningStack ifNil: [ lineJoiningStack := 0 ]
]

{ #category : #accessing }
PythonScanner2 >> lineJoiningStack: anObject [
	lineJoiningStack := anObject
]

{ #category : #private }
PythonScanner2 >> lparen [
	"start of line joining mode"

	self lineJoiningStack: self lineJoiningStack + 1.
	matchActions := Array with: self lparenId.
	^ self createTokenFor: '('
]

{ #category : #generated }
PythonScanner2 >> lparenId [
	^ 81
]

{ #category : #accessing }
PythonScanner2 >> next [
	self tokenStack isEmpty
		ifFalse: [ ^ self tokenStack removeFirst ].
	^ super next
]

{ #category : #private }
PythonScanner2 >> noindent [
	"We should revert to the beginning of the scan."

	self state: #default.
	stream position: start.
	lastLineStart = start
		ifTrue: [ 
			[ self indentStack last > 0 ]
				whileTrue: [ 
					matchActions := Array with: self DEDENTId.
					self tokenStack add: (self createTokenFor: '').
					self indentStack removeLast ] ].
	^ self next
]

{ #category : #private }
PythonScanner2 >> rbrack [
	"end of line joining mode"

	self lineJoiningStack: self lineJoiningStack - 1.
	matchActions := Array with: self rbrackId.
	^ self createTokenFor: ']'
]

{ #category : #generated }
PythonScanner2 >> rbrackId [
	^ 84
]

{ #category : #private }
PythonScanner2 >> rcurly [
	"end of line joining mode"

	self lineJoiningStack: self lineJoiningStack - 1.
	matchActions := Array with: self rcurlyId.
	^ self createTokenFor: '}'
]

{ #category : #generated }
PythonScanner2 >> rcurlyId [
	^ 86
]

{ #category : #private }
PythonScanner2 >> rparen [
	"end of line joining mode"

	self lineJoiningStack: self lineJoiningStack - 1.
	matchActions := Array with: self rparenId.
	^ self createTokenFor: ')'
]

{ #category : #generated }
PythonScanner2 >> rparenId [
	^ 82
]

{ #category : #generated }
PythonScanner2 >> scan1 [
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter == Character cr
		ifTrue:
			[ ^ self scan1X19 ].
	^ self scan1X24
]

{ #category : #generated }
PythonScanner2 >> scan10 [
	[ self recordMatch: #(73).
	self step.
	currentCharacter == $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan11 [
	self step.
	('+-' includes: currentCharacter)
		ifTrue: [ self step ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan12 [
	[ self recordMatch: #(73).
	self step.
	currentCharacter == $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan13 [
	[ self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter == $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan14 [
	self recordMatch: #(71).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan15 [
	self recordMatch: #(75).
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(75) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan16 [
	[ self recordMatch: #(75).
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(75) ].
	currentCharacter == Character cr
		ifTrue: [ ^ self scan15 ].
	true ] whileTrue
]

{ #category : #generated }
PythonScanner2 >> scan1X1 [
	self recordMatch: #(73).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan13 ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan1X1X1 ].
	('Bb' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ [ self recordMatch: #(73).
					self step.
					currentCharacter between: $0 and: $1 ] whileTrue.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(73) ] ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Oo' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ [ self recordMatch: #(73).
					self step.
					currentCharacter between: $0 and: $7 ] whileTrue.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(73) ] ].
			^ self reportLastMatch ].
	('Xx' includes: currentCharacter)
		ifTrue:
			[ ^ self scan1X1X2 ].
	('Ljl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X10 [
	[ self recordMatch: #(79).
	self step.
	currentCharacter == Character tab
		or: [ currentCharacter == Character space ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X11 [
	self recordMatch: #(40).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(29) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X12 [
	self recordMatch: #(37).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(34) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X13 [
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter == Character cr
		ifTrue: [ self recordMatch: #(79).
			self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X14 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X15 [
	self recordMatch: #(53).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X16 [
	self recordMatch: #(44).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X17 [
	self recordMatch: #(38).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X18 [
	self recordMatch: #(51).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X19 [
	self recordMatch: #(80).
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X1X1 [
	[ self recordMatch: #(73).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan13 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Ljl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X1X2 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ [ self recordMatch: #(73).
			self step.
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(73) ].
			currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X2 [
	self recordMatch: #(71).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan14 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Q)
				or: [ (currentCharacter between: $S and: $Z)
						or: [ currentCharacter == $_
								or: [ (currentCharacter between: $a and: $q)
										or: [ currentCharacter between: $s and: $z ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X20 [
	self recordMatch: #(27).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X21 [
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X22 [
	currentCharacter == $^
		ifTrue:
			[ ^ self scan1X12 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(46) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(85) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scan1X11 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(86) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan1X3 ].
	(currentCharacter == Character tab
		or: [ currentCharacter == Character space ])
		ifTrue:
			[ ^ self scan1X10 ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan14 ].
	('BUbu' includes: currentCharacter)
		ifTrue:
			[ ^ self scan1X2 ].
	currentCharacter isSafeForHTTP
		ifTrue:
			[ self scan1X4 ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X23 [
	currentCharacter == $.
		ifTrue:
			[ ^ self scan1X20 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scan1X8 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scan1X5 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scan1X14 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scan1X7 ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(83) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan1X13 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(84) ].
	^ self scan1X22
]

{ #category : #generated }
PythonScanner2 >> scan1X24 [
	currentCharacter == $!
		ifTrue:
			[ ^ self scan1X21 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scan1X6 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scan1X18 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scan1X17 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scan1X9 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scan1X16 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scan1X15 ].
	^ self scan1X23
]

{ #category : #generated }
PythonScanner2 >> scan1X3 [
	[ self recordMatch: #(73).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Ljl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X4 [
	[ self recordMatch: #(71).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue
]

{ #category : #generated }
PythonScanner2 >> scan1X5 [
	self recordMatch: #(64).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(43).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(16) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(45) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X6 [
	[ self recordMatch: #(78).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X7 [
	self recordMatch: #(67).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(54) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(4).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(9) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X8 [
	self recordMatch: #(50).
	self step.
	currentCharacter == $/
		ifTrue: [ self recordMatch: #(48).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan1X9 [
	self recordMatch: #(19).
	self step.
	currentCharacter == $*
		ifTrue: [ self recordMatch: #(20).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan2 [
	self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(72).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter == $\
		ifTrue: [ ^ self scan4 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[)
								or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan3 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(72) ].
	currentCharacter == $\
		ifTrue: [ ^ self scan4 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan4 [
	self step.
	^ self scan3
]

{ #category : #generated }
PythonScanner2 >> scan5 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ (self scanForString: '""')
				ifTrue: [ ^ self recordAndReportMatch: #(72) ].
			^ self scan5 ].
	currentCharacter == $\
		ifTrue: [ self step.
			^ self scan5 ].
	true ] whileTrue
]

{ #category : #generated }
PythonScanner2 >> scan6 [
	self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(72).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter == $\
		ifTrue: [ ^ self scan8 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch
]

{ #category : #generated }
PythonScanner2 >> scan7 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(72) ].
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
PythonScanner2 >> scan8 [
	self step.
	^ self scan7
]

{ #category : #generated }
PythonScanner2 >> scan9 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ (self scanForString: '''''')
				ifTrue: [ ^ self recordAndReportMatch: #(72) ].
			^ self scan9 ].
	currentCharacter == $\
		ifTrue: [ self step.
			^ self scan9 ].
	true ] whileTrue
]

{ #category : #generated }
PythonScanner2 >> scanForToken [
	state == #lineBegin
		ifTrue: [ self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(74 75 77) ].
			currentCharacter == Character cr
				ifTrue: [ self recordMatch: #(74 75 77).
					self step.
					currentCharacter == Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(74 75) ].
					^ self reportLastMatch ].
			currentCharacter == $#
				ifTrue: [ ^ self scan16 ].
			currentCharacter isSeparator
				ifTrue: [ [ self recordMatch: #(76).
					self step.
					currentCharacter == Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(75) ].
					currentCharacter == Character cr
						ifTrue: [ ^ self scan15 ].
					currentCharacter == $#
						ifTrue: [ ^ self scan16 ].
					currentCharacter isSeparator ] whileTrue.
					^ self reportLastMatch ].
			^ self recordAndReportMatch: #(77) ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #private }
PythonScanner2 >> scannerError [
	"Override to be able to reset indents at end of file. And also if it is necessary to create a NEWLINE token."

	(stream atEnd and: [ start == stream position ])
		ifTrue: [ 
			lastLineStart = start
				ifFalse: [ 
					matchActions := Array with: self NEWLINEId.
					self tokenStack add: (self createTokenFor: '<cr>').
					lastLineStart := start ].
			[ self indentStack last > 0 ]
				whileTrue: [ 
					matchActions := Array with: self DEDENTId.
					self tokenStack add: (self createTokenFor: 'Dedent').
					self indentStack removeLast ].
			self tokenStack notEmpty
				ifTrue: [ returnMatchBlock value: self tokenStack removeFirst ] ].
	super scannerError
]

{ #category : #generated }
PythonScanner2 >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #emptyLine #blankLine #indent #noindent #comment #whitespace #NEWLINE #lparen #rparen #lbrack #rbrack #lcurly #rcurly)
]

{ #category : #accessing }
PythonScanner2 >> tokenStack [
	^ tokenStack ifNil: [ tokenStack := OrderedCollection new ]
]

{ #category : #accessing }
PythonScanner2 >> tokenStack: anObject [
	tokenStack := anObject
]
