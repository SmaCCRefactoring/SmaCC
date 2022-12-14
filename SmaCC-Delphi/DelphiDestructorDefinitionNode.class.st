Class {
	#name : #DelphiDestructorDefinitionNode,
	#superclass : #DelphiMethodDefinitionNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiDestructorDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDestructorDefinition: self
]
