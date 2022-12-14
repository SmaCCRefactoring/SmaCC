Class {
	#name : #JavaBooleanLiteralNode,
	#superclass : #JavaLiteralNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaBooleanLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBooleanLiteral: self
]
