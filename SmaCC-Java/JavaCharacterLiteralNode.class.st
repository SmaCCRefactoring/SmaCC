Class {
	#name : #JavaCharacterLiteralNode,
	#superclass : #JavaLiteralNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaCharacterLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCharacterLiteral: self
]
