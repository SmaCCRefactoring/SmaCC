Class {
	#name : #JavaTypeNode,
	#superclass : #JavaProgramNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitType: self
]
