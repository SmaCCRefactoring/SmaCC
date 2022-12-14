Class {
	#name : #DelphiProgramNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
