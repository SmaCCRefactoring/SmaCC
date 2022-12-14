Class {
	#name : #SmaCCReplaceExpressionScanner,
	#superclass : #SmaCCScanner,
	#category : 'SmaCC-Rewrite-Engine'
}

{ #category : #generated }
SmaCCReplaceExpressionScanner >> codeExpressionId [
	^ 13
]

{ #category : #generated }
SmaCCReplaceExpressionScanner >> emptySymbolTokenId [
	^ 24
]

{ #category : #generated }
SmaCCReplaceExpressionScanner >> errorTokenId [
	^ 25
]

{ #category : #testing }
SmaCCReplaceExpressionScanner >> isValidCode [
	RBParser
		parseExpression: outputStream contents
		onError: [ :s :p | ^ false ].
	^ true
]

{ #category : #accessing }
SmaCCReplaceExpressionScanner >> next [
	state = #code
		ifTrue:
			[ self resetScanner.
			returnMatchBlock := [ :match | ^ match ].
			^ self scanCode ].
	^ super next
]

{ #category : #private }
SmaCCReplaceExpressionScanner >> scanCode [
	outputStream reset.
	[ outputStream nextPutAll: (stream upTo: $`).
	stream peek == $`
		ifTrue:
			[ self isValidCode
				ifTrue:
					[ stream skip: -1.
					state := #default.
					^ self recordAndReportMatch: (Array with: self codeExpressionId) ] ].
	stream atEnd
		ifTrue: [ ^ self reportLastMatch ].
	outputStream nextPut: $` ] repeat
]

{ #category : #generated }
SmaCCReplaceExpressionScanner >> scanForToken [
	state == #default
		ifTrue: [ self step.
			currentCharacter == $`
				ifTrue: [ self recordMatch: #(6).
					self step.
					currentCharacter == $`
						ifTrue: [ ^ self recordAndReportMatch: #(7) ].
					^ self reportLastMatch ].
			true
				ifTrue: [ [ self recordMatch: #(5).
					self step.
					currentCharacter ~~ $` ] whileTrue ].
			^ self reportLastMatch ].
	state == #expression
		ifTrue:
			[ ^ self scanForTokenX1 ].
	state == #code
		ifTrue: [ (self scanForString: '``')
				ifTrue: [ ^ self recordAndReportMatch: #(7) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCReplaceExpressionScanner >> scanForTokenX1 [
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $_
		ifTrue: [ self recordMatch: #(1 4).
			self step.
			(currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ])
				ifTrue: [ [ self recordMatch: #(1).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	((currentCharacter between: $! and: $/)
		or: [ (currentCharacter between: $: and: $@)
				or: [ currentCharacter == $[
						or: [ (currentCharacter between: $] and: $^)
								or: [ currentCharacter between: ${ and: $~ ] ] ] ])
		ifTrue: [ [ self recordMatch: #(3).
			self step.
			(currentCharacter between: $! and: $/)
				or: [ (currentCharacter between: $: and: $@)
						or: [ currentCharacter == $[
								or: [ (currentCharacter between: $] and: $^)
										or: [ currentCharacter between: ${ and: $~ ] ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter isLetter
		ifTrue: [ [ self recordMatch: #(1).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch
]
