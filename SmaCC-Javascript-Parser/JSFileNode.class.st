Class {
	#name : #JSFileNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'statements'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSFileNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFile: self
]

{ #category : #generated }
JSFileNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #'generated-initialize-release' }
JSFileNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSFileNode >> statements [
	^ statements
]

{ #category : #generated }
JSFileNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
