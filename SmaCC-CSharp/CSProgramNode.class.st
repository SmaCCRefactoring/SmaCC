Class {
	#name : #CSProgramNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
