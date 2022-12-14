Class {
	#name : #JavaByteTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaByteTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitByteType: self
]
