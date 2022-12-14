Class {
	#name : #DelphiScanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'ifDefCount',
		'definedItems',
		'undefinedItems',
		'ifDefs',
		'optComments',
		'optDepths',
		'parseOpt'
	],
	#classInstVars : [
		'definedItems',
		'undefinedItems'
	],
	#category : 'SmaCC-Delphi'
}

{ #category : #accessing }
DelphiScanner class >> definedItems [
	definedItems isNil
		ifTrue: [ self
				definedItems:
					#('MSWINDOWS' 'PC_MAPPED_EXCEPTIONS' 'PIC' 'VERSION3' 'CHAR_TYPES_INITIALIZED' 'CASE_MAP_INITIALIZED' 'USEGREEDYPASCAL' 'ADSDELPHI2006' 'CONDITIONALEXPRESSIONS' 'USEJCLDEBUG' 'WIN32' 'VER36') ].
	^ definedItems
]

{ #category : #accessing }
DelphiScanner class >> definedItems: aCollection [
	definedItems := Set withAll: (aCollection collect: [ :each | each asUppercase ])
]

{ #category : #'generated-initialization' }
DelphiScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(135 'ABSOLUTE' 35) #(135 'ABSTRACT' 25) #(135 'AND' 47) #(135 'ARRAY' 20) #(135 'AS' 41) #(135 'ASM' 94) #(135 'ASSEMBLER' 120) #(135 'AT' 130) #(135 'BEGIN' 75) #(135 'CASE' 6) #(135 'CDECL' 129) #(135 'CLASS' 2) #(135 'CONST' 52) #(135 'CONSTRUCTOR' 74) #(135 'DEFAULT' 109) #(135 'DEPRECATED' 11) #(135 'DESTRUCTOR' 77) #(135 'DISPID' 108) #(135 'DISPINTERFACE' 19) #(135 'DIV' 34) #(135 'DO' 71) #(135 'DOWNTO' 92) #(135 'DYNAMIC' 121) #(135 'ELSE' 43) #(135 'END' 4) #(135 'EXCEPT' 81) #(135 'EXPORT' 115) #(135 'EXPORTS' 62) #(135 'EXTERNAL' 100) #(135 'FAR' 127) #(135 'FILE' 64) #(135 'FINAL' 122) #(135 'FINALIZATION' 17) #(135 'FINALLY' 91) #(135 'FOR' 26) #(135 'FORWARD' 102) #(135 'FUNCTION' 13) #(135 'GOTO' 73) #(135 'HELPER' 15) #(135 'IF' 66) #(135 'IMPLEMENTATION' 96) #(135 'IMPLEMENTS' 111) #(135 'IN' 53) #(135 'INDEX' 21) #(135 'INHERITED' 82) #(135 'INITIALIZATION' 86) #(135 'INLINE' 117) #(135 'INTERFACE' 56) #(135 'IS' 40) #(135 'LABEL' 79) #(135 'LIBRARY' 63) #(135 'LOCAL' 118) #(135 'MEM' 88) #(135 'MEMW' 83) #(135 'MESSAGE' 105) #(135 'MOD' 37) #(135 'NAME' 113) #(135 'NEAR' 128) #(135 'NODEFAULT' 112) #(135 'NOT' 16) #(135 'OBJECT' 27) #(135 'OF' 42) #(135 'ON' 80) #(135 'OPERATOR' 97) #(135 'OR' 44) #(135 'OUT' 98) #(135 'OVERLOAD' 101) #(135 'OVERRIDE' 104) #(135 'PACKED' 3) #(135 'PASCAL' 124) #(135 'PLATFORM' 12) #(135 'PRIVATE' 29) #(135 'PROCEDURE' 14) #(135 'PROGRAM' 60) #(135 'PROPERTY' 22) #(135 'PROTECTED' 24) #(135 'PUBLIC' 23) #(135 'PUBLISHED' 18) #(135 'RAISE' 90) #(135 'READ' 33) #(135 'READONLY' 107) #(135 'RECORD' 1) #(135 'REGISTER' 114) #(135 'REINTRODUCE' 123) #(135 'REPEAT' 72) #(135 'RESOURCESTRING' 54) #(135 'SAFECALL' 119) #(135 'SEALED' 28) #(135 'SET' 7) #(135 'SHL' 36) #(135 'SHR' 39) #(135 'STATIC' 116) #(135 'STDCALL' 103) #(135 'STORED' 106) #(135 'STRICT' 30) #(135 'THEN' 69) #(135 'THREADVAR' 78) #(135 'TO' 93) #(135 'TRY' 70) #(135 'TYPE' 65) #(135 'UNIT' 57) #(135 'UNSAFE' 125) #(135 'UNTIL' 67) #(135 'USES' 51) #(135 'VAR' 99) #(135 'VIRTUAL' 126) #(135 'WHILE' 95) #(135 'WITH' 68) #(135 'WRITE' 76) #(135 'WRITEONLY' 110) #(135 'XOR' 46) #(136 'ABSOLUTE' 35) #(136 'ABSTRACT' 25) #(136 'AND' 47) #(136 'ARRAY' 20) #(136 'AS' 41) #(136 'ASM' 94) #(136 'ASSEMBLER' 120) #(136 'AT' 130) #(136 'BEGIN' 75) #(136 'CASE' 6) #(136 'CDECL' 129) #(136 'CLASS' 2) #(136 'CONST' 52) #(136 'CONSTRUCTOR' 74) #(136 'DEFAULT' 109) #(136 'DEPRECATED' 11) #(136 'DESTRUCTOR' 77) #(136 'DISPID' 108) #(136 'DISPINTERFACE' 19) #(136 'DIV' 34) #(136 'DO' 71) #(136 'DOWNTO' 92) #(136 'DYNAMIC' 121) #(136 'ELSE' 43) #(136 'END' 4) #(136 'EXCEPT' 81) #(136 'EXPORT' 115) #(136 'EXPORTS' 62) #(136 'EXTERNAL' 100) #(136 'FAR' 127) #(136 'FILE' 64) #(136 'FINAL' 122) #(136 'FINALIZATION' 17) #(136 'FINALLY' 91) #(136 'FOR' 26) #(136 'FORWARD' 102) #(136 'FUNCTION' 13) #(136 'GOTO' 73) #(136 'HELPER' 15) #(136 'IF' 66) #(136 'IMPLEMENTATION' 96) #(136 'IMPLEMENTS' 111) #(136 'IN' 53) #(136 'INDEX' 21) #(136 'INHERITED' 82) #(136 'INITIALIZATION' 86) #(136 'INLINE' 117) #(136 'INTERFACE' 56) #(136 'IS' 40) #(136 'LABEL' 79) #(136 'LIBRARY' 63) #(136 'LOCAL' 118) #(136 'MEM' 88) #(136 'MEMW' 83) #(136 'MESSAGE' 105) #(136 'MOD' 37) #(136 'NAME' 113) #(136 'NEAR' 128) #(136 'NODEFAULT' 112) #(136 'NOT' 16) #(136 'OBJECT' 27) #(136 'OF' 42) #(136 'ON' 80) #(136 'OPERATOR' 97) #(136 'OR' 44) #(136 'OUT' 98) #(136 'OVERLOAD' 101) #(136 'OVERRIDE' 104) #(136 'PACKED' 3) #(136 'PASCAL' 124) #(136 'PLATFORM' 12) #(136 'PRIVATE' 29) #(136 'PROCEDURE' 14) #(136 'PROGRAM' 60) #(136 'PROPERTY' 22) #(136 'PROTECTED' 24) #(136 'PUBLIC' 23) #(136 'PUBLISHED' 18) #(136 'RAISE' 90) #(136 'READ' 33) #(136 'READONLY' 107) #(136 'RECORD' 1) #(136 'REGISTER' 114) #(136 'REINTRODUCE' 123) #(136 'REPEAT' 72) #(136 'RESOURCESTRING' 54) #(136 'SAFECALL' 119) #(136 'SEALED' 28) #(136 'SET' 7) #(136 'SHL' 36) #(136 'SHR' 39) #(136 'STATIC' 116) #(136 'STDCALL' 103) #(136 'STORED' 106) #(136 'STRICT' 30) #(136 'THEN' 69) #(136 'THREADVAR' 78) #(136 'TO' 93) #(136 'TRY' 70) #(136 'TYPE' 65) #(136 'UNIT' 57) #(136 'UNSAFE' 125) #(136 'UNTIL' 67) #(136 'USES' 51) #(136 'VAR' 99) #(136 'VIRTUAL' 126) #(136 'WHILE' 95) #(136 'WITH' 68) #(136 'WRITE' 76) #(136 'WRITEONLY' 110) #(136 'XOR' 46))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #accessing }
DelphiScanner class >> undefinedItems [
	undefinedItems isNil
		ifTrue: [ self
				undefinedItems:
					#('LINUX' 'DECLARE_GPL' 'DEBUG' 'ELF' 'STATIC_UNWIND' 'UNIX' 'KYLIX' 'HOOK_DLL_EXCEPTIONS' 'COMPILER_7_UP' 'WPDF_SOURCE' 'USECOMPATIBLEDC' 'ADSDELPHI4_OR_NEWER' 'USEGREEDYASM' 'CLR' 'BCB' 'DELPHI3' 'DELPHI4' 'DELPHI5' 'DELPHI6' 'DELPHI7' 'DEMO' 'LISTSERVER' 'METAFILE' 'PRNDIB_CKBOOL' 'PRNDIB_CKOVERFLOW' 'VSNET' 'TMSDOTNET' 'VER80' 'DOTNET' 'GRAPHICONTROL' 'CLX' 'TMSCLX' 'UMB') ].
	^ undefinedItems
]

{ #category : #accessing }
DelphiScanner class >> undefinedItems: aCollection [
	undefinedItems := Set withAll: (aCollection collect: [ :each | each asUppercase ])
]

{ #category : #generated }
DelphiScanner >> atId [
	^ 130
]

{ #category : #private }
DelphiScanner >> comment [
	| comment |
	comment := outputStream contents.
	(optDepths includes: ifDefCount)
		ifTrue:
			[ ('{$ELSE*' match: comment)
				ifTrue:
					[ optComments add: (Array with: start + 1 with: matchEnd).
					^ super comment ].
			(('{$ENDIF*' match: comment) or: [ '{$IFEND*' match: comment ])
				ifTrue:
					[ optComments add: (Array with: start + 1 with: matchEnd).
					optDepths remove: ifDefCount.
					^ super comment ] ].
	ifDefCount > 0
		ifTrue:
			[ ((('{$ELSE*' match: comment) and: [ ifDefCount = 1 ])
				or: [ ('{$ENDIF*' match: comment) or: [ '{$IFEND*' match: comment ] ])
				ifTrue:
					[ ifDefCount := ifDefCount - 1.
					ifDefCount = 0
						ifTrue: [ ifDefs last at: 2 put: start + comment size ] ]
				ifFalse: [ ('{$IF*' match: comment)
						ifTrue: [ ifDefCount := ifDefCount + 1 ] ] ]
		ifFalse:
			[ ('{$IF*' match: comment)
				ifTrue: [ ^ self processIfMacro: comment ].
			('{$ELSE*' match: comment)
				ifTrue: [ ^ self skipUntilEndDef ] ].
	^ super comment
]

{ #category : #generated }
DelphiScanner >> constantIdentifierId [
	^ 136
]

{ #category : #generated }
DelphiScanner >> controlCharacterId [
	^ 367
]

{ #category : #accessing }
DelphiScanner >> definedItems [
	^ definedItems
]

{ #category : #accessing }
DelphiScanner >> definedItems: aCollection [
	definedItems := aCollection
]

{ #category : #generated }
DelphiScanner >> emptySymbolTokenId [
	^ 364
]

{ #category : #generated }
DelphiScanner >> errorTokenId [
	^ 365
]

{ #category : #generated }
DelphiScanner >> identifierId [
	^ 135
]

{ #category : #'initialize-release' }
DelphiScanner >> ifDefs [
	^ ifDefs
]

{ #category : #'initialize-release' }
DelphiScanner >> initialize [
	super initialize.
	ifDefCount := 0.
	definedItems := self class definedItems.
	undefinedItems := self class undefinedItems.
	comments := OrderedCollection new.
	optComments := OrderedCollection new.
	optDepths := OrderedCollection new.
	ifDefs := OrderedCollection new
]

{ #category : #private }
DelphiScanner >> integerWithRange [
	stream skip: -2.
	matchEnd := matchEnd - 2.
	matchActions := Array with: self numberId.
	^ self
		createTokenFor:
			(outputStream
				skip: -2;
				contents)
]

{ #category : #generated }
DelphiScanner >> keywordFor: aString [
	^ aString asUppercase
]

{ #category : #generated }
DelphiScanner >> minusId [
	^ 131
]

{ #category : #generated }
DelphiScanner >> numberId [
	^ 137
]

{ #category : #accessing }
DelphiScanner >> optComments [
	^ optComments
]

{ #category : #accessing }
DelphiScanner >> optComments: anObject [
	optComments := anObject
]

{ #category : #accessing }
DelphiScanner >> parseOpt [
	^ parseOpt ifNil: [ false ]
]

{ #category : #accessing }
DelphiScanner >> parseOpt: aBoolean [
	parseOpt := aBoolean
]

{ #category : #generated }
DelphiScanner >> plusId [
	^ 132
]

{ #category : #private }
DelphiScanner >> processIfMacro: comment [
	| command name index bad |
	index := (1 to: comment size)
		detect: [ :each | (comment at: each) isSeparator ]
		ifNone: [ comment size ].
	command := comment copyFrom: 3 to: index - 1.
	name := index = comment size
		ifTrue: [ '' ]
		ifFalse: [ (comment copyFrom: index + 1 to: comment size - 1) trim ].
	bad := #().
	('DEFINED(*)' match: name)
		ifTrue:
			[ bad := self undefinedItems.
			name := name copyFrom: 9 to: name size - 1 ].
	(command sameAs: 'IFDEF')
		ifTrue: [ bad := self undefinedItems ].
	(command sameAs: 'IFNDEF')
		ifTrue: [ bad := self definedItems ].
	(bad includes: name asUppercase)
		ifTrue: [ ^ self skipUntilEndDef ].
	(self parseOpt
		and: [ (command sameAs: 'IFOPT') and: [ name sameAs: 'C+' ] ])
		ifTrue:
			[ optDepths add: ifDefCount.
			optComments add: (Array with: start + 1 with: matchEnd) ].
	^ super comment
]

{ #category : #private }
DelphiScanner >> processIncludeFile: aString [
	^ self next
]

{ #category : #generated }
DelphiScanner >> scan1 [
	self step.
	currentCharacter == $$
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(139).
					self step.
					currentCharacter == $#
						ifTrue: [ ^ self scan1 ].
					currentCharacter == $'
						ifTrue: [ ^ self scan2 ].
					currentCharacter == $^
						ifTrue: [ ^ self scan6 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(139).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan6 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan10 [
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan11 [
	[ self recordMatch: #(137).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan12 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(137).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(137).
					self step.
					currentCharacter isDigit ] whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan13 [
	[ self recordMatch: #(137).
	self step.
	currentCharacter == $.
		ifTrue: [ self recordMatch: #(137).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(138) ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan11 ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan14 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ self recordMatch: #(143).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan14 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan15 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(142).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan15 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
DelphiScanner >> scan2 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
DelphiScanner >> scan3 [
	self recordMatch: #(139).
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self scan4 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $^
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan4 [
	self step.
	currentCharacter == $$
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(139).
					self step.
					currentCharacter == $#
						ifTrue: [ ^ self scan4 ].
					currentCharacter == $'
						ifTrue: [ ^ self scan2 ].
					currentCharacter == $^
						ifTrue: [ ^ self scan5 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(139).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan4 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan5 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan5 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan6 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan6 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan7 [
	self step.
	currentCharacter == $$
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self step.
					currentCharacter == $#
						ifTrue: [ ^ self scan7 ].
					currentCharacter == $'
						ifTrue: [ ^ self scan2 ].
					currentCharacter == $^
						ifTrue: [ ^ self scan6 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan6 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan8 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ [ self recordMatch: #(137).
			self step.
			currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan9 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			currentCharacter == $* ] whileTrue.
			^ self scan9 ].
	true ] whileTrue
]

{ #category : #private }
DelphiScanner >> scanControlCharacter [
	stream peek isLetter
		ifFalse: [ ^ nil ].
	start := stream position - 1.
	matchActions := Array with: self controlCharacterId.
	^ self createTokenFor: (String with: $^ with: stream next)
]

{ #category : #generated }
DelphiScanner >> scanForToken [
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $$
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $(
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	^ self scanForTokenX14
]

{ #category : #generated }
DelphiScanner >> scanForTokenX1 [
	self recordMatch: #(134).
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan14 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX10 [
	self recordMatch: #(31).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(87) ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX11 [
	self recordMatch: #(8).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(45) ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX12 [
	self recordMatch: #(61).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX13 [
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan15 ].
	currentCharacter == ${
		ifTrue: [ [ self step.
			currentCharacter == $}
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			true ] whileTrue ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan13 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp
				or: [ currentCharacter =
						(Character value: 26) ] ])
		ifTrue:
			[ ^ self scanForTokenX4 ].
	(currentCharacter isSafeForHTTP
		or:
			[ 'ÄÖÜäöü' includes: currentCharacter ])
		ifTrue:
			[ self scanForTokenX2 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX14 [
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(50) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(133) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(48) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	^ self scanForTokenX13
]

{ #category : #generated }
DelphiScanner >> scanForTokenX2 [
	[ self recordMatch: #(135 136).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $z)
								or:
									[ 'ÄÖÜäöü' includes: currentCharacter ] ] ] ] ] whileTrue
]

{ #category : #generated }
DelphiScanner >> scanForTokenX3 [
	self recordMatch: #(49).
	self step.
	currentCharacter == $/
		ifTrue: [ [ self step.
			(currentCharacter == Character lf
				or: [ currentCharacter == Character cr ])
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX4 [
	[ self recordMatch: #(141).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp
				or: [ currentCharacter =
						(Character value: 26) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX5 [
	self recordMatch: #(131).
	self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan13 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX6 [
	self recordMatch: #(132).
	self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan13 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX7 [
	self step.
	('Oo' includes: currentCharacter)
		ifTrue: [ self step.
			('Pp' includes: currentCharacter)
				ifTrue: [ self step.
					('Ee' includes: currentCharacter)
						ifTrue: [ self step.
							('Rr' includes: currentCharacter)
								ifTrue: [ self step.
									('Aa' includes: currentCharacter)
										ifTrue: [ self step.
											('Tt' includes: currentCharacter)
												ifTrue: [ self step.
													('Oo' includes: currentCharacter)
														ifTrue: [ self step.
															('Rr' includes: currentCharacter)
																ifTrue: [ ^ self recordAndReportMatch: #(89) ] ] ] ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX8 [
	self recordMatch: #(32).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(84) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(85) ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX9 [
	self recordMatch: #(59).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> semicolonId [
	^ 133
]

{ #category : #private }
DelphiScanner >> skipToEndToken [
	| token previous |
	previous := SmaCCToken value: ''.
	[ [ stream atEnd
		or: [ (token := self next) value asUppercase ~= 'END' ] ]
		whileTrue: [ previous := token ].
	previous value = '@' ] whileTrue.
	(token value sameAs: 'END')
		ifTrue: [ stream position: token startPosition - 1 ]
]

{ #category : #private }
DelphiScanner >> skipUntilEndDef [
	| value entry |
	entry := Array with: start + 1 with: nil.
	ifDefs add: entry.
	comments add: (Array with: start + 1 with: matchEnd).
	ifDefCount := 1.
	[ value := self next.
	ifDefCount > 0 ] whileTrue.
	^ value
]

{ #category : #generated }
DelphiScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #integerWithRange nil #comment #whitespace #patternToken)
]

{ #category : #generated }
DelphiScanner >> tokenClass [
	^SmaCCCaseInsensitiveToken
]

{ #category : #private }
DelphiScanner >> undefinedItems [
	^ undefinedItems
]

{ #category : #accessing }
DelphiScanner >> undefinedItems: aCollection [
	undefinedItems := aCollection
]

{ #category : #generated }
DelphiScanner >> upArrowId [
	^ 134
]
