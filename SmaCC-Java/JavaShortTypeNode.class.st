Class {
	#name : #JavaShortTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaShortTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitShortType: self
]
