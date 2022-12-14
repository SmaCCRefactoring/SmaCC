Class {
	#name : #LLVMTargetDefinitionNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'targetToken',
		'target'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMTargetDefinitionNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitTargetDefinition: self
]

{ #category : #generated }
LLVMTargetDefinitionNode >> target [
	^ target
]

{ #category : #generated }
LLVMTargetDefinitionNode >> target: aSmaCCToken [
	target := aSmaCCToken
]

{ #category : #generated }
LLVMTargetDefinitionNode >> targetToken [
	^ targetToken
]

{ #category : #generated }
LLVMTargetDefinitionNode >> targetToken: aSmaCCToken [
	targetToken := aSmaCCToken
]

{ #category : #generated }
LLVMTargetDefinitionNode >> tokenVariables [
	^ #(#targetToken #target)
]
