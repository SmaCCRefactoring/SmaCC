Class {
	#name : #PyRootNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyRootNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitRoot: self
]
