Class {
	#name : #DelphiFormIntegerNode,
	#superclass : #DelphiFormLiteralNode,
	#category : 'SmaCC-DelphiForms'
}

{ #category : #generated }
DelphiFormIntegerNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitInteger: self
]
