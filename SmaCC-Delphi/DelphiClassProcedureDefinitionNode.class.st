Class {
	#name : #DelphiClassProcedureDefinitionNode,
	#superclass : #DelphiProcedureDefinitionNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiClassProcedureDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassProcedureDefinition: self
]
