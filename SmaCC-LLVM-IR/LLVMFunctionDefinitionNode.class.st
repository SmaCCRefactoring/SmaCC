Class {
	#name : #LLVMFunctionDefinitionNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'defineToken',
		'function'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMFunctionDefinitionNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitFunctionDefinition: self
]

{ #category : #generated }
LLVMFunctionDefinitionNode >> defineToken [
	^ defineToken
]

{ #category : #generated }
LLVMFunctionDefinitionNode >> defineToken: aSmaCCToken [
	defineToken := aSmaCCToken
]

{ #category : #generated }
LLVMFunctionDefinitionNode >> function [
	^ function
]

{ #category : #generated }
LLVMFunctionDefinitionNode >> function: aSmaCCToken [
	function := aSmaCCToken
]

{ #category : #generated }
LLVMFunctionDefinitionNode >> tokenVariables [
	^ #(#defineToken #function)
]
