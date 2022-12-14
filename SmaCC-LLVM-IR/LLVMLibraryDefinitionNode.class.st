Class {
	#name : #LLVMLibraryDefinitionNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'deplibsToken',
		'equalToken',
		'libraries'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMLibraryDefinitionNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitLibraryDefinition: self
]

{ #category : #generated }
LLVMLibraryDefinitionNode >> deplibsToken [
	^ deplibsToken
]

{ #category : #generated }
LLVMLibraryDefinitionNode >> deplibsToken: aSmaCCToken [
	deplibsToken := aSmaCCToken
]

{ #category : #generated }
LLVMLibraryDefinitionNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
LLVMLibraryDefinitionNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
LLVMLibraryDefinitionNode >> libraries [
	^ libraries
]

{ #category : #generated }
LLVMLibraryDefinitionNode >> libraries: aSmaCCToken [
	libraries := aSmaCCToken
]

{ #category : #generated }
LLVMLibraryDefinitionNode >> tokenVariables [
	^ #(#deplibsToken #equalToken #libraries)
]
