Class {
	#name : #DelphiFormBooleanNode,
	#superclass : #DelphiFormLiteralNode,
	#category : 'SmaCC-DelphiForms'
}

{ #category : #generated }
DelphiFormBooleanNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitBoolean: self
]
