Class {
	#name : #SwiftParseNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-Swift'
}

{ #category : #generated }
SwiftParseNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitParse: self
]
