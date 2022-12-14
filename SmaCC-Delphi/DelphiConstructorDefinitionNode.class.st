Class {
	#name : #DelphiConstructorDefinitionNode,
	#superclass : #DelphiMethodDefinitionNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiConstructorDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstructorDefinition: self
]
