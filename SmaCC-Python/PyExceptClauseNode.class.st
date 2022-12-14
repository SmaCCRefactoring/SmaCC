Class {
	#name : #PyExceptClauseNode,
	#superclass : #PyRootNode,
	#instVars : [
		'exceptToken',
		'except',
		'asToken',
		'another',
		'commaToken',
		'except2'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyExceptClauseNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitExceptClause: self
]

{ #category : #generated }
PyExceptClauseNode >> another [
	^ another
]

{ #category : #generated }
PyExceptClauseNode >> another: aPyRootNode [
	self another notNil
		ifTrue: [ self another parent: nil ].
	another := aPyRootNode.
	self another notNil
		ifTrue: [ self another parent: self ]
]

{ #category : #generated }
PyExceptClauseNode >> asToken [
	^ asToken
]

{ #category : #generated }
PyExceptClauseNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
PyExceptClauseNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
PyExceptClauseNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
PyExceptClauseNode >> except [
	^ except
]

{ #category : #generated }
PyExceptClauseNode >> except2 [
	^ except2
]

{ #category : #generated }
PyExceptClauseNode >> except2: aPyRootNode [
	self except2 notNil
		ifTrue: [ self except2 parent: nil ].
	except2 := aPyRootNode.
	self except2 notNil
		ifTrue: [ self except2 parent: self ]
]

{ #category : #generated }
PyExceptClauseNode >> except: aPyRootNode [
	self except notNil
		ifTrue: [ self except parent: nil ].
	except := aPyRootNode.
	self except notNil
		ifTrue: [ self except parent: self ]
]

{ #category : #generated }
PyExceptClauseNode >> exceptToken [
	^ exceptToken
]

{ #category : #generated }
PyExceptClauseNode >> exceptToken: aSmaCCToken [
	exceptToken := aSmaCCToken
]

{ #category : #generated }
PyExceptClauseNode >> nodeVariables [
	^ #(#except #another #except2)
]

{ #category : #generated }
PyExceptClauseNode >> tokenVariables [
	^ #(#exceptToken #asToken #commaToken)
]
