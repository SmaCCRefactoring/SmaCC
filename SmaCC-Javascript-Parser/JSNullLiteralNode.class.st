Class {
	#name : #JSNullLiteralNode,
	#superclass : #JSLiteralNode,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSNullLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNullLiteral: self
]
