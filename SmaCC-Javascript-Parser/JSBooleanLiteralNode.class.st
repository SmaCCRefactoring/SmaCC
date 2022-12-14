Class {
	#name : #JSBooleanLiteralNode,
	#superclass : #JSLiteralNode,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSBooleanLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBooleanLiteral: self
]
