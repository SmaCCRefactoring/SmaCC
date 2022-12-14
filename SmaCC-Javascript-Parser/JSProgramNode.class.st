Class {
	#name : #JSProgramNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
