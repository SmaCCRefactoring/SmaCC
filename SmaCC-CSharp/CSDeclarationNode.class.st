Class {
	#name : #CSDeclarationNode,
	#superclass : #CSProgramNode,
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDeclaration: self
]
