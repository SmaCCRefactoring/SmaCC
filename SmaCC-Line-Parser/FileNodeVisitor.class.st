Class {
	#name : #FileNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : 'SmaCC-Line-Parser'
}

{ #category : #generated }
FileNodeVisitor >> visitFileNode: aFileNode [
	^ self visitSmaCCParseNode: aFileNode
]
