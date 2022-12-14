Class {
	#name : #JavaDoubleTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaDoubleTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDoubleType: self
]
