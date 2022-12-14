Class {
	#name : #SmaCCRewriteTestExpressionNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : 'SmaCC-Rewrite-Engine-Tests'
}

{ #category : #generated }
SmaCCRewriteTestExpressionNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitExpression: aBinaryExpression
]

{ #category : #generated }
SmaCCRewriteTestExpressionNodeVisitor >> visitExpression: anExpression [
	^ self visitSmaCCParseNode: anExpression
]

{ #category : #generated }
SmaCCRewriteTestExpressionNodeVisitor >> visitNumber: aNumber [
	^ self visitExpression: aNumber
]
