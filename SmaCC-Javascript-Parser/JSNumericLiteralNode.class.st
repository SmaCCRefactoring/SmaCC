Class {
	#name : #JSNumericLiteralNode,
	#superclass : #JSLiteralNode,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSNumericLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNumericLiteral: self
]
