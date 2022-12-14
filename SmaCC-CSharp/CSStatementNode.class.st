Class {
	#name : #CSStatementNode,
	#superclass : #CSProgramNode,
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatement: self
]
