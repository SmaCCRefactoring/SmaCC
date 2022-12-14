Class {
	#name : #JavaIntegerLiteralNode,
	#superclass : #JavaLiteralNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaIntegerLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIntegerLiteral: self
]
