Class {
	#name : #DelphiTypeNode,
	#superclass : #DelphiProgramNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitType: self
]
