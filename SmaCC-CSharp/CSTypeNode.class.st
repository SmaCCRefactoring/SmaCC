Class {
	#name : #CSTypeNode,
	#superclass : #CSProgramNode,
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitType: self
]
