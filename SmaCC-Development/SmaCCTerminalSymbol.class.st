Class {
	#name : #SmaCCTerminalSymbol,
	#superclass : #SmaCCSymbol,
	#instVars : [
		'regularExpression',
		'createIdMethod'
	],
	#category : 'SmaCC-Development'
}

{ #category : #private }
SmaCCTerminalSymbol >> calculateFirstTerminals [
	^ false
]

{ #category : #accessing }
SmaCCTerminalSymbol >> createIdMethod [
	^ createIdMethod
]

{ #category : #accessing }
SmaCCTerminalSymbol >> createIdMethod: aBoolean [
	createIdMethod := aBoolean
]

{ #category : #'initialize-release' }
SmaCCTerminalSymbol >> initialize [
	super initialize.
	firstTerminals add: self.
	createIdMethod := false
]

{ #category : #testing }
SmaCCTerminalSymbol >> isTerminal [
	^ true
]

{ #category : #private }
SmaCCTerminalSymbol >> makeCaseInsensitive [
	regularExpression notNil
		ifTrue: [ regularExpression makeCaseInsensitive ]
]

{ #category : #accessing }
SmaCCTerminalSymbol >> modelTypes: anIdentitySet [
	^ Set with: (self model classFor: SmaCCToken)
]

{ #category : #accessing }
SmaCCTerminalSymbol >> regularExpression [
	^ regularExpression
]

{ #category : #accessing }
SmaCCTerminalSymbol >> regularExpression: aSmaCCRegularExpressionNode [
	regularExpression := aSmaCCRegularExpressionNode
]

{ #category : #private }
SmaCCTerminalSymbol >> unsafeMethodName [
	^ name copyFrom: 2 to: name size - 1
]
