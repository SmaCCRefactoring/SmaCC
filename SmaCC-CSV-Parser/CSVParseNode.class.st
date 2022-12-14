Class {
	#name : #CSVParseNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-CSV-Parser'
}

{ #category : #generated }
CSVParseNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitParse: self
]
