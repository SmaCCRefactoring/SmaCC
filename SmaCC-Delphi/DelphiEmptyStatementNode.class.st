Class {
	#name : #DelphiEmptyStatementNode,
	#superclass : #DelphiStatementNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiEmptyStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEmptyStatement: self
]
