Class {
	#name : #JavaStatementNode,
	#superclass : #JavaProgramNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatement: self
]
