Class {
	#name : #DelphiProcedureDefinitionNode,
	#superclass : #DelphiMethodDefinitionNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiProcedureDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProcedureDefinition: self
]
