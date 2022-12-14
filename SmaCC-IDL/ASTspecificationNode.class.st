Class {
	#name : #ASTspecificationNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTspecificationNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitspecification: self
]
