Class {
	#name : #LLVMAbstractNode,
	#superclass : #SmaCCParseNode,
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMAbstractNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitAbstract: self
]
