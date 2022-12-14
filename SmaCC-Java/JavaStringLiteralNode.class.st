Class {
	#name : #JavaStringLiteralNode,
	#superclass : #JavaLiteralNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaStringLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStringLiteral: self
]
