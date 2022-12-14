Class {
	#name : #JavaCharTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaCharTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCharType: self
]
