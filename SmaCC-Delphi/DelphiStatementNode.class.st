Class {
	#name : #DelphiStatementNode,
	#superclass : #DelphiProgramNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatement: self
]
