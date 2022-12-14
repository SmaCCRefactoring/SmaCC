"
I represent a way to more easily debug a parser.

I contain decompilation code to represent in an explicit manner the states of the parser.

I have a different parsing loop to make it easier to step by action or by token.

I have an announcer to trace the evolution of the parser state and stack.
"
Class {
	#name : #SmaCCRDebugParser,
	#superclass : #SmaCCParser,
	#instVars : [
		'announcer',
		'decompiler'
	],
	#category : 'SmaCC-Development-Debug'
}

{ #category : #accessing }
SmaCCRDebugParser >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
SmaCCRDebugParser >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
SmaCCRDebugParser >> decompiler [
	^ decompiler
]

{ #category : #accessing }
SmaCCRDebugParser >> decompiler: anObject [
	decompiler := anObject
]

{ #category : #'initialize-release' }
SmaCCRDebugParser >> initialize [
	super initialize.
	decompiler := SmaCCRParseTable for: self
]

{ #category : #private }
SmaCCRDebugParser >> performAction: action [
	self announcer
		announce:
			(SmaCCRAnnounce new
				action:
					(SmaCCRTransition
						onAction: action
						for: currentToken id first
						in: decompiler);
				stack: self stateStack;
				nodeStack: self nodeStack).
	super performAction: action
]

{ #category : #private }
SmaCCRDebugParser >> performActionsForCurrentToken [
	"This method will loop as long as it reduces, and only return after a shift, signaling a need to fetch a new token."

	| action |
	[ currentToken notNil ]
		whileTrue: [ action := self actionForCurrentToken.
			action = self acceptAction
				ifTrue: [ ^ true ].
			self performAction: action ].
	^ false
]

{ #category : #private }
SmaCCRDebugParser >> performParsingLoop [
	[ self getNextToken.
	self performActionsForCurrentToken ] whileFalse.
	self checkForErrors
]
