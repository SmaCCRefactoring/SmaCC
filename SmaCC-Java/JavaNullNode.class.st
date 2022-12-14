Class {
	#name : #JavaNullNode,
	#superclass : #JavaLiteralNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaNullNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNull: self
]
