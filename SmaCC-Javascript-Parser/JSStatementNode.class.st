Class {
	#name : #JSStatementNode,
	#superclass : #JSProgramNode,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatement: self
]
