Class {
	#name : #StScanner,
	#superclass : #SmaCCScanner,
	#category : 'SmaCC-Smalltalk-Parser'
}

{ #category : #'generated-initialization' }
StScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(20 'false' 12) #(20 'nil' 14) #(20 'true' 11) #(26 '||' 15))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
StScanner >> binarySymbolId [
	^ 26
]

{ #category : #generated }
StScanner >> emptySymbolTokenId [
	^ 65
]

{ #category : #generated }
StScanner >> errorTokenId [
	^ 66
]

{ #category : #generated }
StScanner >> nameId [
	^ 20
]

{ #category : #private }
StScanner >> negativeNumber [
	stream skip: -2.
	^self scanNumber: self negativeNumberId
]

{ #category : #generated }
StScanner >> negativeNumberId [
	^ 22
]

{ #category : #private }
StScanner >> number [
	stream skip: -1.
	^self scanNumber: self numberId
]

{ #category : #generated }
StScanner >> numberId [
	^ 21
]

{ #category : #generated }
StScanner >> scan1 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
StScanner >> scan2 [
	self recordMatch: #(23).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scan3 [
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(29).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan3 ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scan4 [
	self recordMatch: #(24).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scan5 [
	[ self step.
	currentCharacter == $:
		ifTrue: [ self recordMatch: #(25).
			self step.
			(currentCharacter isLetter or: [ currentCharacter == $_ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForToken [
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scanForTokenX4 ].
	currentCharacter == $#
		ifTrue: [ ^ self recordAndReportMatch: #(1 32) ].
	currentCharacter == $$
		ifTrue: [ ^ self scanForTokenX11 ].
	currentCharacter == $'
		ifTrue: [ ^ self scanForTokenX10 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(10 32) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(4 32) ].
	currentCharacter == $-
		ifTrue: [ ^ self scanForTokenX3 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(5 32) ].
	currentCharacter == $:
		ifTrue: [ ^ self scanForTokenX5 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(2 32) ].
	currentCharacter == $<
		ifTrue: [ ^ self scanForTokenX9 ].
	^ self scanForTokenX12
]

{ #category : #generated }
StScanner >> scanForTokenX1 [
	self recordMatch: #(20 32).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan4 ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(20).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan3 ].
			currentCharacter == $:
				ifTrue: [ ^ self scan4 ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForTokenX10 [
	self recordMatch: #(32).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
StScanner >> scanForTokenX11 [
	self recordMatch: #(32).
	self step.
	^ self recordAndReportMatch: #(30)
]

{ #category : #generated }
StScanner >> scanForTokenX12 [
	currentCharacter == $>
		ifTrue: [ ^ self scanForTokenX8 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(17 32) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(19 32) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(16 32) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(3 32) ].
	currentCharacter == $|
		ifTrue: [ ^ self scanForTokenX7 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(8 32) ].
	currentCharacter isDigit
		ifTrue: [ ^ self recordAndReportMatch: #(21 32) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character null ])
		ifTrue: [ ^ self scanForTokenX2 ].
	currentCharacter isSpecial
		ifTrue: [ ^ self scanForTokenX6 ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue: [ ^ self scanForTokenX1 ].
	^ self recordAndReportMatch: #(32)
]

{ #category : #generated }
StScanner >> scanForTokenX2 [
	self recordMatch: #(27 32).
	self step.
	(currentCharacter isSeparator
		or: [ currentCharacter == Character null ])
		ifTrue: [ [ self recordMatch: #(27).
			self step.
			currentCharacter isSeparator
				or: [ currentCharacter == Character null ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForTokenX3 [
	self recordMatch: #(26 32).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForTokenX4 [
	self recordMatch: #(32).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	true
		ifTrue: [ [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForTokenX5 [
	self recordMatch: #(18 32).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForTokenX6 [
	self recordMatch: #(26 32).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForTokenX7 [
	self recordMatch: #(9 26 32).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForTokenX8 [
	self recordMatch: #(7 26 32).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
StScanner >> scanForTokenX9 [
	self recordMatch: #(6 26 32).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #private }
StScanner >> scanNumber: id [ 
	| number |
	number := Number readFrom: stream.
	outputStream reset.
	matchActions := Array with: id.
	^self createTokenFor: number
]

{ #category : #generated }
StScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #number #negativeNumber nil nil nil nil #whitespace #comment nil nil #variableAssignment)
]

{ #category : #private }
StScanner >> variableAssignment [
	| token |
	outputStream skip: -2.
	stream skip: -2.
	matchActions := Array with: self nameId.
	token := self createTokenFor: outputStream contents.
	outputStream reset.
	^token
]
