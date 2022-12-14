Class {
	#name : #DelphiClassFunctionDefinitionNode,
	#superclass : #DelphiFunctionDefinitionNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiClassFunctionDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassFunctionDefinition: self
]
