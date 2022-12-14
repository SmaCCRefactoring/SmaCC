Class {
	#name : #SmaCCParserDebugSession,
	#superclass : #DebugSession,
	#instVars : [
		'rootContext'
	],
	#category : 'SmaCC-Debugging-Support'
}

{ #category : #testing }
SmaCCParserDebugSession >> isActive [
	^ rootContext notNil and: [ rootContext isDead not and: [ rootContext ~= self process suspendedContext or: [ rootContext willReturn not ] ] ]
]

{ #category : #accessing }
SmaCCParserDebugSession >> parser [
	^ self rootContext notNil
		ifTrue: [ self rootContext receiver ]
]

{ #category : #accessing }
SmaCCParserDebugSession >> rootContext [
	^ rootContext
		ifNil: [ rootContext := interruptedContext
				findContextSuchThat:
					[ :each | each selector = #parse and: [ each receiver isKindOf: SmaCCParser ] ] ]
]

{ #category : #accessing }
SmaCCParserDebugSession >> scanner [
	^ self parser scanner
]
