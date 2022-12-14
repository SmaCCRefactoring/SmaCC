Class {
	#name : #LLVMModuleNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'definitions'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMModuleNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitModule: self
]

{ #category : #generated }
LLVMModuleNode >> compositeNodeVariables [
	^ #(#definitions)
]

{ #category : #generated }
LLVMModuleNode >> definitions [
	^ definitions
]

{ #category : #generated }
LLVMModuleNode >> definitions: anOrderedCollection [
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self
]

{ #category : #'generated-initialize-release' }
LLVMModuleNode >> initialize [
	super initialize.
	definitions := OrderedCollection new: 2.
]

{ #category : #generated }
LLVMModuleNode >> pluralVariablesMap [
	^ Dictionary new
		at: 'definition' put: 'definitions';
		yourself
]
