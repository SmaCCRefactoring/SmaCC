Class {
	#name : #JavaBooleanTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaBooleanTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBooleanType: self
]
