Class {
	#name : #LLVMAsmModuleNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'moduleToken',
		'asmToken',
		'asm'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMAsmModuleNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitAsmModule: self
]

{ #category : #generated }
LLVMAsmModuleNode >> asm [
	^ asm
]

{ #category : #generated }
LLVMAsmModuleNode >> asm: aSmaCCToken [
	asm := aSmaCCToken
]

{ #category : #generated }
LLVMAsmModuleNode >> asmToken [
	^ asmToken
]

{ #category : #generated }
LLVMAsmModuleNode >> asmToken: aSmaCCToken [
	asmToken := aSmaCCToken
]

{ #category : #generated }
LLVMAsmModuleNode >> moduleToken [
	^ moduleToken
]

{ #category : #generated }
LLVMAsmModuleNode >> moduleToken: aSmaCCToken [
	moduleToken := aSmaCCToken
]

{ #category : #generated }
LLVMAsmModuleNode >> tokenVariables [
	^ #(#moduleToken #asmToken #asm)
]
