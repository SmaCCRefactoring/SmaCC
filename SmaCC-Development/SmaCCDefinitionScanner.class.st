"
SmaCCDefinitionScanner is the SmaCCScanner for the parser definition.

Instance Variables:
	parseSourceSelector	<Symbol>	a symbol that can be performed to parse the code inside the {} reduce actions


"
Class {
	#name : #SmaCCDefinitionScanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'parseSourceSelector'
	],
	#category : 'SmaCC-Development'
}

{ #category : #'generated-initialization' }
SmaCCDefinitionScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(30 'annotate_tokens' #(26 #(#directives))) #(30 'attributes' #(15 #(#directives))) #(30 'error' #(8 #(#default #directives #parser #scanner))) #(30 'excludes' #(12 #(#directives))) #(30 'glr' #(23 #(#directives))) #(30 'hierarchy' #(14 #(#directives))) #(30 'id' #(21 #(#directives))) #(30 'ignore_variables' #(25 #(#directives))) #(30 'ignorecase' #(24 #(#directives))) #(30 'left' #(18 #(#directives))) #(30 'nonassoc' #(20 #(#directives))) #(30 'parser' #(11 #(#directives))) #(30 'prefix' #(16 #(#directives))) #(30 'right' #(19 #(#directives))) #(30 'root' #(13 #(#directives))) #(30 'start' #(22 #(#directives))) #(30 'states' #(10 #(#directives))) #(30 'suffix' #(17 #(#directives))) #(30 'unicode' #(27 #(#directives))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #testing }
SmaCCDefinitionScanner class >> needsLineNumbers [
	"Redefine to return true, if you need line number information"

	^ true
]

{ #category : #testing }
SmaCCDefinitionScanner >> canParse: aString [
	^ self perform: parseSourceSelector with: aString
]

{ #category : #testing }
SmaCCDefinitionScanner >> canParseSmalltalk: aString [
	RBParser parseExpression: aString onError: [ :error :pos | ^ false ].
	^ true
]

{ #category : #generated }
SmaCCDefinitionScanner >> classLeftId [
	^ 43
]

{ #category : #generated }
SmaCCDefinitionScanner >> classRightId [
	^ 44
]

{ #category : #'token-actions' }
SmaCCDefinitionScanner >> code [
	| code |
	code := ''.
	[ code := code , (stream upTo: $}).
	self canParse: code ]
		whileFalse: [ stream atEnd
				ifTrue: [ ^ self scannerError ].
			code := code , '}' ].
	matchActions := Array with: self codeId.
	^ self createTokenFor: '{' , code , '}'
]

{ #category : #generated }
SmaCCDefinitionScanner >> codeId [
	^ 33
]

{ #category : #generated }
SmaCCDefinitionScanner >> directiveId [
	^ 36
]

{ #category : #generated }
SmaCCDefinitionScanner >> emptySymbolTokenId [
	^ 92
]

{ #category : #generated }
SmaCCDefinitionScanner >> errorTokenId [
	^ 93
]

{ #category : #'initialize-release' }
SmaCCDefinitionScanner >> initialize [
	super initialize.
	parseSourceSelector := #canParseSmalltalk:
]

{ #category : #generated }
SmaCCDefinitionScanner >> keywordId [
	^ 31
]

{ #category : #'initialize-release' }
SmaCCDefinitionScanner >> parseSourceSelector: aSymbol [
	parseSourceSelector := aSymbol
]

{ #category : #generated }
SmaCCDefinitionScanner >> productionId [
	^ 35
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan1 [
	self step.
	currentCharacter ~~ $"
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan10 [
	[ self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(39) ].
	true ] whileTrue
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan11 [
	self step.
	currentCharacter == $c
		ifTrue: [ self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	currentCharacter == $x
		ifTrue: [ self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	^ self scan10
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan12 [
	[ self step.
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(40) ].
	currentCharacter between: $0 and: $9 ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(31).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan3 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_
				or: [ (currentCharacter between: $a and: $z)
						or: [ ('ªµº' includes: currentCharacter)
								or: [ (currentCharacter
										between: (Character value: 192)
										and: (Character value: 214))
										or: [ (currentCharacter
												between: (Character value: 216)
												and: (Character value: 246))
												or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan4 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(34) ].
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $z)
								or: [ ('ªµº' includes: currentCharacter)
										or: [ (currentCharacter
												between: (Character value: 192)
												and: (Character value: 214))
												or: [ (currentCharacter
														between: (Character value: 216)
														and: (Character value: 246))
														or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan5 [
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan6 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(32) ].
			^ self scan6 ].
	true ] whileTrue
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan7 [
	self recordMatch: #(35).
	self step.
	currentCharacter == $:
		ifTrue: [ self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(35) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan8 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_
				or: [ (currentCharacter between: $a and: $z)
						or: [ ('ªµº' includes: currentCharacter)
								or: [ (currentCharacter
										between: (Character value: 192)
										and: (Character value: 214))
										or: [ (currentCharacter
												between: (Character value: 216)
												and: (Character value: 246))
												or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ])
		ifTrue: [ [ self step.
			currentCharacter == $>
				ifTrue: [ ^ self recordAndReportMatch: #(29) ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_
								or: [ (currentCharacter between: $a and: $z)
										or: [ ('ªµº' includes: currentCharacter)
												or: [ (currentCharacter
														between: (Character value: 192)
														and: (Character value: 214))
														or: [ (currentCharacter
																between: (Character value: 216)
																and: (Character value: 246))
																or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9 [
	self step.
	currentCharacter == Character newPage
		ifTrue: [ ^ self scan9X7 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan9X10 ].
	currentCharacter == $#
		ifTrue: [ ^ self scan9X4 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter == $'
		ifTrue: [ ^ self scan9X2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self scan9X12
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X1 [
	self recordMatch: #(30 41).
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $z)
								or: [ ('ªµº' includes: currentCharacter)
										or: [ (currentCharacter
												between: (Character value: 192)
												and: (Character value: 214))
												or: [ (currentCharacter
														between: (Character value: 216)
														and: (Character value: 246))
														or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(30).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_
								or: [ (currentCharacter between: $a and: $z)
										or: [ ('ªµº' includes: currentCharacter)
												or: [ (currentCharacter
														between: (Character value: 192)
														and: (Character value: 214))
														or: [ (currentCharacter
																between: (Character value: 216)
																and: (Character value: 246))
																or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X10 [
	self recordMatch: #(41).
	self step.
	currentCharacter ~~ $"
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X11 [
	currentCharacter == ${
		ifTrue: [ ^ self scan9X6 ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(5 41) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ ^ self scan9X8 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_
				or: [ (currentCharacter between: $a and: $z)
						or: [ ('ªµº' includes: currentCharacter)
								or: [ (currentCharacter
										between: (Character value: 192)
										and: (Character value: 214))
										or: [ (currentCharacter
												between: (Character value: 216)
												and: (Character value: 246))
												or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ])
		ifTrue: [ ^ self scan9X1 ].
	^ self recordAndReportMatch: #(41)
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X12 [
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(9 41) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(1 41) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(4 41) ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan9X9 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(37 41) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(6 41) ].
	currentCharacter == $[
		ifTrue: [ ^ self scan9X5 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan9X3 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(3 41) ].
	^ self scan9X11
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X2 [
	self recordMatch: #(41).
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_
				or: [ (currentCharacter between: $a and: $z)
						or: [ ('ªµº' includes: currentCharacter)
								or: [ (currentCharacter
										between: (Character value: 192)
										and: (Character value: 214))
										or: [ (currentCharacter
												between: (Character value: 216)
												and: (Character value: 246))
												or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X3 [
	self step.
	currentCharacter == $c
		ifTrue: [ self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self recordAndReportMatch: #(38) ].
			^ self reportLastMatch ].
	currentCharacter == $x
		ifTrue: [ self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ self recordMatch: #(38).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self recordMatch: #(38).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self recordMatch: #(38).
									self step.
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ ^ self recordAndReportMatch: #(38) ] ] ] ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(38)
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X4 [
	self recordMatch: #(32 41).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(32).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X5 [
	self recordMatch: #(7).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan11 ].
	(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X6 [
	self recordMatch: #(33).
	self step.
	currentCharacter == $,
		ifTrue: [ ^ self scan12 ].
	(currentCharacter between: $0 and: $9)
		ifTrue: [ [ self step.
			currentCharacter == $,
				ifTrue: [ ^ self scan12 ].
			currentCharacter between: $0 and: $9 ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X7 [
	self recordMatch: #(28 41).
	self step.
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(28).
			self step.
			currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X8 [
	[ self recordMatch: #(28).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scan9X9 [
	self recordMatch: #(41).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForToken [
	state == #parser
		ifTrue:
			[ ^ self scanForTokenX1 ].
	state == #scanner
		ifTrue: [ ^ self scan9 ].
	(#(#default #directives) includes: state)
		ifTrue: [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $#
				ifTrue:
					[ ^ self scanForTokenX3 ].
			currentCharacter == $%
				ifTrue: [ ^ self recordAndReportMatch: #(36) ].
			currentCharacter == $'
				ifTrue: [ ^ self scan3 ].
			currentCharacter == $(
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter == $*
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			currentCharacter == $+
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			currentCharacter == $/
				ifTrue: [ ^ self scan5 ].
			currentCharacter == $:
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $;
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			currentCharacter == $<
				ifTrue: [ ^ self scan8 ].
			currentCharacter == $?
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			currentCharacter == $[
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			currentCharacter == $]
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter == ${
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			currentCharacter == $|
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			(currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ])
				ifTrue:
					[ ^ self scanForTokenX4 ].
			((currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $z)
								or: [ ('ªµº' includes: currentCharacter)
										or: [ (currentCharacter
												between: (Character value: 192)
												and: (Character value: 214))
												or: [ (currentCharacter
														between: (Character value: 216)
														and: (Character value: 246))
														or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ])
				ifTrue:
					[ self scanForTokenX2 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX1 [
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX1X2 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	^ self scanForTokenX1X7
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX1X1 [
	[ self recordMatch: #(30).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $z)
								or: [ ('ªµº' includes: currentCharacter)
										or: [ (currentCharacter
												between: (Character value: 192)
												and: (Character value: 214))
												or: [ (currentCharacter
														between: (Character value: 216)
														and: (Character value: 246))
														or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ] ] ]
		whileTrue
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX1X2 [
	[ self recordMatch: #(32).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX1X3 [
	[ self recordMatch: #(28).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX1X4 [
	self recordMatch: #(33).
	self step.
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(43) ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX1X5 [
	self step.
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(44) ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX1X6 [
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $}
		ifTrue:
			[ ^ self scanForTokenX1X5 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX1X3 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_
				or: [ (currentCharacter between: $a and: $z)
						or: [ ('ªµº' includes: currentCharacter)
								or: [ (currentCharacter
										between: (Character value: 192)
										and: (Character value: 214))
										or: [ (currentCharacter
												between: (Character value: 216)
												and: (Character value: 246))
												or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ])
		ifTrue:
			[ self scanForTokenX1X1 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX1X7 [
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == ${
		ifTrue:
			[ ^ self scanForTokenX1X4 ].
	^ self scanForTokenX1X6
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX2 [
	[ self recordMatch: #(30).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $z)
								or: [ ('ªµº' includes: currentCharacter)
										or: [ (currentCharacter
												between: (Character value: 192)
												and: (Character value: 214))
												or: [ (currentCharacter
														between: (Character value: 216)
														and: (Character value: 246))
														or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ] ] ]
		whileTrue
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX3 [
	[ self recordMatch: #(32).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> scanForTokenX4 [
	[ self recordMatch: #(28).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCDefinitionScanner >> semicolonId [
	^ 37
]

{ #category : #generated }
SmaCCDefinitionScanner >> symbolnameId [
	^ 30
]

{ #category : #generated }
SmaCCDefinitionScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace nil nil nil #comment #code)
]

{ #category : #generated }
SmaCCDefinitionScanner >> tokennameId [
	^ 29
]

{ #category : #generated }
SmaCCDefinitionScanner >> variablenameId [
	^ 34
]
