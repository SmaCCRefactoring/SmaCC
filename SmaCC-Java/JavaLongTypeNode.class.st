Class {
	#name : #JavaLongTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaLongTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLongType: self
]
