Class {
	#name : #SwiftStatementNode,
	#superclass : #SwiftParseNode,
	#category : 'SmaCC-Swift'
}

{ #category : #generated }
SwiftStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitStatement: self
]
