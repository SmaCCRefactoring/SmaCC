Class {
	#name : #JavaFloatTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaFloatTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFloatType: self
]
