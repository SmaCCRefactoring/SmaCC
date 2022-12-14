Class {
	#name : #PyCompOpNode,
	#superclass : #PyRootNode,
	#instVars : [
		'lessThanToken',
		'greaterThanToken',
		'equalEqualToken',
		'greaterThanEqualToken',
		'lessThanEqualToken',
		'lessThanGreaterThanToken',
		'bangEqualToken',
		'inToken',
		'notToken',
		'isToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyCompOpNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitCompOp: self
]

{ #category : #generated }
PyCompOpNode >> bangEqualToken [
	^ bangEqualToken
]

{ #category : #generated }
PyCompOpNode >> bangEqualToken: aSmaCCToken [
	bangEqualToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> equalEqualToken [
	^ equalEqualToken
]

{ #category : #generated }
PyCompOpNode >> equalEqualToken: aSmaCCToken [
	equalEqualToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> greaterThanEqualToken [
	^ greaterThanEqualToken
]

{ #category : #generated }
PyCompOpNode >> greaterThanEqualToken: aSmaCCToken [
	greaterThanEqualToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> greaterThanToken [
	^ greaterThanToken
]

{ #category : #generated }
PyCompOpNode >> greaterThanToken: aSmaCCToken [
	greaterThanToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> inToken [
	^ inToken
]

{ #category : #generated }
PyCompOpNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> isToken [
	^ isToken
]

{ #category : #generated }
PyCompOpNode >> isToken: aSmaCCToken [
	isToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> lessThanEqualToken [
	^ lessThanEqualToken
]

{ #category : #generated }
PyCompOpNode >> lessThanEqualToken: aSmaCCToken [
	lessThanEqualToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> lessThanGreaterThanToken [
	^ lessThanGreaterThanToken
]

{ #category : #generated }
PyCompOpNode >> lessThanGreaterThanToken: aSmaCCToken [
	lessThanGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> lessThanToken [
	^ lessThanToken
]

{ #category : #generated }
PyCompOpNode >> lessThanToken: aSmaCCToken [
	lessThanToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> notToken [
	^ notToken
]

{ #category : #generated }
PyCompOpNode >> notToken: aSmaCCToken [
	notToken := aSmaCCToken
]

{ #category : #generated }
PyCompOpNode >> tokenVariables [
	^ #(#lessThanToken #greaterThanToken #equalEqualToken #greaterThanEqualToken #lessThanEqualToken #lessThanGreaterThanToken #bangEqualToken #inToken #notToken #isToken)
]
