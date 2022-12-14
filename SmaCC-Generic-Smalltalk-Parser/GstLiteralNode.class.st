Class {
	#name : #GstLiteralNode,
	#superclass : #GstValueNode,
	#category : 'SmaCC-Generic-Smalltalk-Parser'
}

{ #category : #generated }
GstLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLiteral: self
]
