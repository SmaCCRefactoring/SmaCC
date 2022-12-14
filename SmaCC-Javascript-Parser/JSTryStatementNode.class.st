Class {
	#name : #JSTryStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'tryToken',
		'tryBlock',
		'catchToken',
		'leftParen',
		'exceptionType',
		'rightParen',
		'catchBlock',
		'finallyToken',
		'finallyBlock'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSTryStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTryStatement: self
]

{ #category : #generated }
JSTryStatementNode >> catchBlock [
	^ catchBlock
]

{ #category : #generated }
JSTryStatementNode >> catchBlock: aJSBlockStatementNode [
	self catchBlock notNil
		ifTrue: [ self catchBlock parent: nil ].
	catchBlock := aJSBlockStatementNode.
	self catchBlock notNil
		ifTrue: [ self catchBlock parent: self ]
]

{ #category : #generated }
JSTryStatementNode >> catchToken [
	^ catchToken
]

{ #category : #generated }
JSTryStatementNode >> catchToken: aSmaCCToken [
	catchToken := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> exceptionType [
	^ exceptionType
]

{ #category : #generated }
JSTryStatementNode >> exceptionType: aSmaCCToken [
	exceptionType := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> finallyBlock [
	^ finallyBlock
]

{ #category : #generated }
JSTryStatementNode >> finallyBlock: aJSBlockStatementNode [
	self finallyBlock notNil
		ifTrue: [ self finallyBlock parent: nil ].
	finallyBlock := aJSBlockStatementNode.
	self finallyBlock notNil
		ifTrue: [ self finallyBlock parent: self ]
]

{ #category : #generated }
JSTryStatementNode >> finallyToken [
	^ finallyToken
]

{ #category : #generated }
JSTryStatementNode >> finallyToken: aSmaCCToken [
	finallyToken := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JSTryStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JSTryStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> nodeVariables [
	^ #(#tryBlock #catchBlock #finallyBlock)
]

{ #category : #generated }
JSTryStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JSTryStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> tokenVariables [
	^ #(#tryToken #catchToken #exceptionType #finallyToken)
]

{ #category : #generated }
JSTryStatementNode >> tryBlock [
	^ tryBlock
]

{ #category : #generated }
JSTryStatementNode >> tryBlock: aJSBlockStatementNode [
	self tryBlock notNil
		ifTrue: [ self tryBlock parent: nil ].
	tryBlock := aJSBlockStatementNode.
	self tryBlock notNil
		ifTrue: [ self tryBlock parent: self ]
]

{ #category : #generated }
JSTryStatementNode >> tryToken [
	^ tryToken
]

{ #category : #generated }
JSTryStatementNode >> tryToken: aSmaCCToken [
	tryToken := aSmaCCToken
]
