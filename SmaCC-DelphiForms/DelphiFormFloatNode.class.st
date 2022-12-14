Class {
	#name : #DelphiFormFloatNode,
	#superclass : #DelphiFormLiteralNode,
	#category : 'SmaCC-DelphiForms'
}

{ #category : #generated }
DelphiFormFloatNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitFloat: self
]
