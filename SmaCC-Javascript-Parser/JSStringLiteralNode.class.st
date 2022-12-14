Class {
	#name : #JSStringLiteralNode,
	#superclass : #JSLiteralNode,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSStringLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStringLiteral: self
]
