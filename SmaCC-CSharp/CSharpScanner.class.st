Class {
	#name : #CSharpScanner,
	#superclass : #SmaCCScanner,
	#category : 'SmaCC-CSharp'
}

{ #category : #'generated-initialization' }
CSharpScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(157 'abstract' #(90 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'add' #(85 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'alias' #(56 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'as' #(31 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'ascending' #(127 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'assembly' #(114 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'await' #(1 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'base' #(29 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'bool' #(40 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'break' #(151 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'by' #(133 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'byte' #(41 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'case' #(145 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'catch' #(138 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'char' #(68 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'checked' #(13 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'class' #(121 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'const' #(130 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'continue' #(148 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'decimal' #(39 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'default' #(17 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'delegate' #(21 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'descending' #(126 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'do' #(149 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'double' #(70 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'else' #(139 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'enum' #(109 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'equals' #(72 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'event' #(80 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'explicit' #(107 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'extern' #(51 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'false' #(92 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'field' #(112 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'finally' #(142 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'fixed' #(103 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'float' #(71 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'for' #(150 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'foreach' #(152 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'from' #(20 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'get' #(78 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'goto' #(144 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'group' #(128 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'if' #(125 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'implicit' #(108 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'in' #(23 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'int' #(44 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'interface' #(110 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'internal' #(88 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'into' #(77 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'is' #(15 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'join' #(26 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'let' #(22 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'lock' #(141 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'long' #(53 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'method' #(115 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'module' #(113 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'nameof' #(16 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'namespace' #(50 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'new' #(11 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'null' #(170 #(#default))) #(157 'object' #(74 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'on' #(25 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'operator' #(83 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'orderby' #(89 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'out' #(60 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'override' #(82 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'param' #(105 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'params' #(79 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'partial' #(97 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'private' #(91 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'property' #(101 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'protected' #(106 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'public' #(111 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'readonly' #(93 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'ref' #(61 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'remove' #(84 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'return' #(143 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'sbyte' #(42 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'sealed' #(95 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'select' #(129 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'set' #(81 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'short' #(46 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'sizeof' #(104 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'stackalloc' #(102 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'static' #(47 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'string' #(73 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'struct' #(94 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'switch' #(146 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'this' #(63 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'throw' #(136 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'true' #(87 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'try' #(135 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'type' #(98 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'typeof' #(14 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'uint' #(48 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'ulong' #(69 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'unchecked' #(18 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'unsafe' #(100 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'ushort' #(45 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'using' #(54 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'var' #(122 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'virtual' #(86 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'void' #(67 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'volatile' #(96 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'when' #(137 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'where' #(27 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'while' #(147 #(#default #interpolatedString #interpolatedVerbatimString))) #(157 'yield' #(140 #(#default #interpolatedString #interpolatedVerbatimString))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
CSharpScanner >> IdentifierId [
	^ 157
]

{ #category : #generated }
CSharpScanner >> emptySymbolTokenId [
	^ 609
]

{ #category : #generated }
CSharpScanner >> errorTokenId [
	^ 610
]

{ #category : #generated }
CSharpScanner >> gtId [
	^ 153
]

{ #category : #generated }
CSharpScanner >> gtgtId [
	^ 154
]

{ #category : #generated }
CSharpScanner >> rightBraceId [
	^ 155
]

{ #category : #generated }
CSharpScanner >> scan1 [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scan1X4 ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scan1X9 ].
	currentCharacter == $%
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $&
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $*
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $+
		ifTrue: [ ^ self scan12 ].
	^ self scan1X12
]

{ #category : #generated }
CSharpScanner >> scan10 [
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(160) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan11 [
	self recordMatch: #(4).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(134) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan12 [
	self recordMatch: #(19).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(34) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(132) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan13 [
	self recordMatch: #(9).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(131) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(99) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan14 [
	[ self recordMatch: #(159).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan15 ].
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(159) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan15 [
	self step.
	('+-' includes: currentCharacter)
		ifTrue: [ self step ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan16 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan16 [
	[ self recordMatch: #(159).
	self step.
	currentCharacter isDigit ] whileTrue.
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(159) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan17 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(156) ].
			^ self scan17 ].
	true ] whileTrue
]

{ #category : #generated }
CSharpScanner >> scan18 [
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan19 [
	[ self recordMatch: #(158 159).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan18 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan15 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self scan20 ].
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self scan21 ].
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(159) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X1 [
	self step.
	currentCharacter == $\
		ifTrue: [ self step.
			currentCharacter == $x
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							currentCharacter == $'
								ifTrue: [ ^ self recordAndReportMatch: #(160) ].
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self step.
									currentCharacter == $'
										ifTrue: [ ^ self recordAndReportMatch: #(160) ].
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ self step.
											currentCharacter == $'
												ifTrue: [ ^ self recordAndReportMatch: #(160) ].
											(currentCharacter isDigit
												or: [ (currentCharacter between: $A and: $F)
														or: [ currentCharacter between: $a and: $f ] ])
												ifTrue: [ ^ self scan10 ] ] ] ].
					^ self reportLastMatch ].
			('Uu' includes: currentCharacter)
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
												ifTrue: [ self step.
													currentCharacter == $'
														ifTrue: [ ^ self recordAndReportMatch: #(160) ].
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
																				ifTrue: [ ^ self scan10 ] ] ] ] ] ] ] ].
					^ self reportLastMatch ].
			(('"''0\' includes: currentCharacter)
				or: [ (currentCharacter between: $a and: $b)
						or:
							[ 'fnrtv' includes: currentCharacter ] ])
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $&)
				or: [ (currentCharacter between: $( and: $[)
						or: [ currentCharacter >= $] ] ] ])
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X10 [
	self recordMatch: #(49).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X11 [
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(76) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	currentCharacter == $^
		ifTrue: [ ^ self scan27 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan28 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	currentCharacter == $|
		ifTrue: [ ^ self scan29 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(155) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan19 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scan1X7 ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue:
			[ self scan1X8 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X12 [
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter == $-
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scan1X10 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scan1X3 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan1X2 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan22 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $=
		ifTrue: [ ^ self scan24 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scan1X6 ].
	currentCharacter == $?
		ifTrue: [ ^ self scan25 ].
	currentCharacter == $@
		ifTrue:
			[ ^ self scan1X5 ].
	^ self scan1X11
]

{ #category : #generated }
CSharpScanner >> scan1X2 [
	self recordMatch: #(158 159).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan18 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan19 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan15 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self scan20 ].
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self scan21 ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(158).
					self step.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self scan20 ].
					('Uu' includes: currentCharacter)
						ifTrue: [ ^ self scan21 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(159) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X3 [
	self recordMatch: #(3).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan17 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(156).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(124) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X4 [
	[ self recordMatch: #(171).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X5 [
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan26 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(157).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X6 [
	self recordMatch: #(153).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(154).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(123) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X7 [
	[ self recordMatch: #(171).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan1X8 [
	[ self recordMatch: #(157).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue
]

{ #category : #generated }
CSharpScanner >> scan1X9 [
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $@
		ifTrue: [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan7 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan2 [
	self recordMatch: #(5).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan20 [
	self recordMatch: #(158).
	self step.
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(158) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan21 [
	self recordMatch: #(158).
	self step.
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(158) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan22 [
	self recordMatch: #(58).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(43) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan23 [
	self recordMatch: #(59).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(7).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(118) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan24 [
	self recordMatch: #(57).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan25 [
	self recordMatch: #(75).
	self step.
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan26 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(169).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan26 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
CSharpScanner >> scan27 [
	self recordMatch: #(37).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(119) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan28 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(172).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan28 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
CSharpScanner >> scan29 [
	self recordMatch: #(36).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(116) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan3 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan3X1 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $!)
				or: [ (currentCharacter between: $# and: $[)
						or: [ currentCharacter >= $] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan30 [
	self recordMatch: #(3).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(124) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan31 [
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $>
		ifTrue: [ self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(123) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan32 [
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(157).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan33 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(163) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan33X1 ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(164).
			self step.
			currentCharacter == ${
				ifTrue: [ ^ self scan33 ].
			^ self reportLastMatch ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $!)
				or: [ (currentCharacter between: $# and: $[)
						or: [ (currentCharacter between: $] and: $z)
								or: [ currentCharacter >= $| ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan33X1 [
	self step.
	currentCharacter == $x
		ifTrue: [ ^ self scan34 ].
	('Uu' includes: currentCharacter)
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
								ifTrue: [ ^ self scan34 ] ] ].
			^ self reportLastMatch ].
	(('"''0\' includes: currentCharacter)
		or: [ (currentCharacter between: $a and: $b)
				or:
					[ 'fnrtv' includes: currentCharacter ] ])
		ifTrue: [ ^ self scan33 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan34 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ ^ self scan33 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan35 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(167).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan35 ].
			^ self reportLastMatch ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(168).
			self step.
			currentCharacter == ${
				ifTrue: [ ^ self scan35 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
CSharpScanner >> scan3X1 [
	self step.
	currentCharacter == $x
		ifTrue: [ ^ self scan4 ].
	('Uu' includes: currentCharacter)
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
								ifTrue: [ ^ self scan4 ] ] ].
			^ self reportLastMatch ].
	(('"''0\' includes: currentCharacter)
		or: [ (currentCharacter between: $a and: $b)
				or:
					[ 'fnrtv' includes: currentCharacter ] ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan4 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan5 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(161) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan5X1 ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(162).
			self step.
			currentCharacter == ${
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $!)
				or: [ (currentCharacter between: $# and: $[)
						or: [ (currentCharacter between: $] and: $z)
								or: [ currentCharacter >= $| ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan5X1 [
	self step.
	currentCharacter == $x
		ifTrue: [ ^ self scan6 ].
	('Uu' includes: currentCharacter)
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
								ifTrue: [ ^ self scan6 ] ] ].
			^ self reportLastMatch ].
	(('"''0\' includes: currentCharacter)
		or: [ (currentCharacter between: $a and: $b)
				or:
					[ 'fnrtv' includes: currentCharacter ] ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan6 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan7 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(165).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(166).
			self step.
			currentCharacter == ${
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
CSharpScanner >> scan8 [
	self recordMatch: #(8).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(120) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scan9 [
	self recordMatch: #(32).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(117) ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scanForToken [
	state == #interpolatedString
		ifTrue:
			[ ^ self scanForTokenX2 ].
	state == #interpolatedVerbatimString
		ifTrue:
			[ ^ self scanForTokenX1 ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scanForTokenX1 [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $%
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $&
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	^ self scanForTokenX1X3
]

{ #category : #generated }
CSharpScanner >> scanForTokenX1X1 [
	[ self recordMatch: #(157).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue
]

{ #category : #generated }
CSharpScanner >> scanForTokenX1X2 [
	currentCharacter == $?
		ifTrue: [ ^ self scan25 ].
	currentCharacter == $@
		ifTrue: [ ^ self scan32 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(76) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	currentCharacter == $^
		ifTrue: [ ^ self scan27 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan28 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	currentCharacter == $|
		ifTrue: [ ^ self scan29 ].
	currentCharacter == $}
		ifTrue: [ ^ self scan35 ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue:
			[ self scanForTokenX1X1 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scanForTokenX1X3 [
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $*
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $+
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter == $-
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan30 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan22 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $=
		ifTrue: [ ^ self scan24 ].
	currentCharacter == $>
		ifTrue: [ ^ self scan31 ].
	^ self scanForTokenX1X2
]

{ #category : #generated }
CSharpScanner >> scanForTokenX2 [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $%
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $&
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	^ self scanForTokenX2X3
]

{ #category : #generated }
CSharpScanner >> scanForTokenX2X1 [
	[ self recordMatch: #(157).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue
]

{ #category : #generated }
CSharpScanner >> scanForTokenX2X2 [
	currentCharacter == $?
		ifTrue: [ ^ self scan25 ].
	currentCharacter == $@
		ifTrue: [ ^ self scan32 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(76) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	currentCharacter == $^
		ifTrue: [ ^ self scan27 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan28 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	currentCharacter == $|
		ifTrue: [ ^ self scan29 ].
	currentCharacter == $}
		ifTrue: [ ^ self scan33 ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue:
			[ self scanForTokenX2X1 ].
	^ self reportLastMatch
]

{ #category : #generated }
CSharpScanner >> scanForTokenX2X3 [
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $*
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $+
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter == $-
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan30 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan22 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $=
		ifTrue: [ ^ self scan24 ].
	currentCharacter == $>
		ifTrue: [ ^ self scan31 ].
	^ self scanForTokenX2X2
]

{ #category : #generated }
CSharpScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace #patternToken)
]
