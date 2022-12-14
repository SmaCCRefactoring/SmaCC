"
I step foward one token at a time
"
Class {
	#name : #SmaCCParserNextTokenAction,
	#superclass : #SmaCCParserStepAction,
	#category : 'SmaCC-Debugging-Support'
}

{ #category : #registration }
SmaCCParserNextTokenAction class >> gtActionFor: aDebugger [
	<gtSmaCCDebuggingParserAction>
	^ (self forDebugger: aDebugger)
		icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #testing }
SmaCCParserNextTokenAction >> appliesToContext: aContext [
	^ (super appliesToContext: aContext)
		and: [ self session parser atEnd not ]
]

{ #category : #accessing }
SmaCCParserNextTokenAction >> defaultLabel [
	^ 'Next Token'
]

{ #category : #accessing }
SmaCCParserNextTokenAction >> defaultOrder [
	^ 100
]

{ #category : #accessing }
SmaCCParserNextTokenAction >> executeAction [
	| token |
	token := self session parser currentToken.
	self
		stepUntil: [ :context | 
			(context
				findContextSuchThat:
					[ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #parse ] ])
				isNil
				or: [ self session parser currentToken ~~ token
						and: [ self session parser currentToken notNil ] ] ]
]

{ #category : #accessing }
SmaCCParserNextTokenAction >> help [
	^ 'Step forward until the scanner has produced a new token'
]
