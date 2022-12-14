Class {
	#name : #CSUsingNamespaceDirectiveNode,
	#superclass : #CSProgramNode,
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSUsingNamespaceDirectiveNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUsingNamespaceDirective: self
]
