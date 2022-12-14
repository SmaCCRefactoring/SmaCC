Class {
	#name : #DelphiFormLiteralNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'value'
	],
	#category : 'SmaCC-DelphiForms'
}

{ #category : #generated }
DelphiFormLiteralNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitLiteral: self
]

{ #category : #generated }
DelphiFormLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
DelphiFormLiteralNode >> value [
	^ value
]

{ #category : #generated }
DelphiFormLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
