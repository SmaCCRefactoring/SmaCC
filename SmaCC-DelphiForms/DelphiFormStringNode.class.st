Class {
	#name : #DelphiFormStringNode,
	#superclass : #DelphiFormLiteralNode,
	#category : 'SmaCC-DelphiForms'
}

{ #category : #generated }
DelphiFormStringNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitString: self
]
