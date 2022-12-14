Class {
	#name : #LLVMLocalTypeAssignNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'assign',
		'typeToken',
		'types'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMLocalTypeAssignNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitLocalTypeAssign: self
]

{ #category : #generated }
LLVMLocalTypeAssignNode >> assign [
	^ assign
]

{ #category : #generated }
LLVMLocalTypeAssignNode >> assign: anOrderedCollection [
	assign := anOrderedCollection
]

{ #category : #generated }
LLVMLocalTypeAssignNode >> otherVariables [
	^ #(#assign #types)
]

{ #category : #generated }
LLVMLocalTypeAssignNode >> tokenVariables [
	^ #(#typeToken)
]

{ #category : #generated }
LLVMLocalTypeAssignNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
LLVMLocalTypeAssignNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]

{ #category : #generated }
LLVMLocalTypeAssignNode >> types [
	^ types
]

{ #category : #generated }
LLVMLocalTypeAssignNode >> types: anOrderedCollection [
	types := anOrderedCollection
]
