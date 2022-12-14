Class {
	#name : #SmaCCReplaceExpression,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-Rewrite-Engine'
}

{ #category : #generated }
SmaCCReplaceExpression >> acceptVisitor: aReplaceVisitor [
	^ aReplaceVisitor visitReplace: self
]

{ #category : #evaluating }
SmaCCReplaceExpression >> evaluateInContext: aSmaCCRewriteMatchContext [
	self subclassResponsibility
]
