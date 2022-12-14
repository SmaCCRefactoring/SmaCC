Class {
	#name : #DelphiFunctionDefinitionNode,
	#superclass : #DelphiMethodDefinitionNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiFunctionDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFunctionDefinition: self
]
