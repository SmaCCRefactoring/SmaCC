Class {
	#name : #LLVMLocalVoidAssignNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'assign',
		'typeToken',
		'voidToken'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMLocalVoidAssignNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitLocalVoidAssign: self
]

{ #category : #generated }
LLVMLocalVoidAssignNode >> assign [
	^ assign
]

{ #category : #generated }
LLVMLocalVoidAssignNode >> assign: anOrderedCollection [
	assign := anOrderedCollection
]

{ #category : #generated }
LLVMLocalVoidAssignNode >> otherVariables [
	^ #(#assign)
]

{ #category : #generated }
LLVMLocalVoidAssignNode >> tokenVariables [
	^ #(#typeToken #voidToken)
]

{ #category : #generated }
LLVMLocalVoidAssignNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
LLVMLocalVoidAssignNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]

{ #category : #generated }
LLVMLocalVoidAssignNode >> voidToken [
	^ voidToken
]

{ #category : #generated }
LLVMLocalVoidAssignNode >> voidToken: aSmaCCToken [
	voidToken := aSmaCCToken
]
