Class {
	#name : #GstByteArrayLiteralNode,
	#superclass : #GstArrayLiteralNode,
	#category : 'SmaCC-Generic-Smalltalk-Parser'
}

{ #category : #generated }
GstByteArrayLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitByteArrayLiteral: self
]
