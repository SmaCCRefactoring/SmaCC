Class {
	#name : #JavaIntTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaIntTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIntType: self
]
