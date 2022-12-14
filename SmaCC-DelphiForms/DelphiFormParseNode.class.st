Class {
	#name : #DelphiFormParseNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-DelphiForms'
}

{ #category : #generated }
DelphiFormParseNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitParse: self
]
