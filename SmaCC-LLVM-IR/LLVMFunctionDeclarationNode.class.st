Class {
	#name : #LLVMFunctionDeclarationNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'declareToken',
		'prototype'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMFunctionDeclarationNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitFunctionDeclaration: self
]

{ #category : #generated }
LLVMFunctionDeclarationNode >> declareToken [
	^ declareToken
]

{ #category : #generated }
LLVMFunctionDeclarationNode >> declareToken: aSmaCCToken [
	declareToken := aSmaCCToken
]

{ #category : #generated }
LLVMFunctionDeclarationNode >> prototype [
	^ prototype
]

{ #category : #generated }
LLVMFunctionDeclarationNode >> prototype: aSmaCCToken [
	prototype := aSmaCCToken
]

{ #category : #generated }
LLVMFunctionDeclarationNode >> tokenVariables [
	^ #(#declareToken #prototype)
]
