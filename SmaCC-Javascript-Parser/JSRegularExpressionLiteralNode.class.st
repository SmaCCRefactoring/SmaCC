Class {
	#name : #JSRegularExpressionLiteralNode,
	#superclass : #JSLiteralNode,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSRegularExpressionLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRegularExpressionLiteral: self
]
