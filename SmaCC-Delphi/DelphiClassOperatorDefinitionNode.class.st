Class {
	#name : #DelphiClassOperatorDefinitionNode,
	#superclass : #DelphiFunctionDefinitionNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiClassOperatorDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassOperatorDefinition: self
]
