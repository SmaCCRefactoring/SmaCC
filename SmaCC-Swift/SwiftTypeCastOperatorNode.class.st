Class {
	#name : #SwiftTypeCastOperatorNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'isToken',
		'type',
		'asToken',
		'questionMarkToken'
	],
	#category : 'SmaCC-Swift'
}

{ #category : #generated }
SwiftTypeCastOperatorNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitTypeCastOperator: self
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> asToken [
	^ asToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> isToken [
	^ isToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> isToken: aSmaCCToken [
	isToken := aSmaCCToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> tokenVariables [
	^ #(#isToken #asToken #questionMarkToken)
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> type [
	^ type
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> type: aSwiftParseNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aSwiftParseNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
