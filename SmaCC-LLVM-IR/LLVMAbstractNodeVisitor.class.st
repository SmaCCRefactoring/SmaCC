Class {
	#name : #LLVMAbstractNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitAbstract: anAbstract [
	^ self visitSmaCCParseNode: anAbstract
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitAsmModule: anAsmModule [
	^ self visitAbstract: anAsmModule
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitFunctionDeclaration: aFunctionDeclaration [
	^ self visitAbstract: aFunctionDeclaration
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitFunctionDefinition: aFunctionDefinition [
	^ self visitAbstract: aFunctionDefinition
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitGlobalAliasAssign: aGlobalAliasAssign [
	^ self visitAbstract: aGlobalAliasAssign
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitGlobalConstAssign: aGlobalConstAssign [
	^ self visitAbstract: aGlobalConstAssign
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitGlobalTypeAssign: aGlobalTypeAssign [
	^ self visitAbstract: aGlobalTypeAssign
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitLibraryDefinition: aLibraryDefinition [
	^ self visitAbstract: aLibraryDefinition
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitLocalTypeAssign: aLocalTypeAssign [
	^ self visitAbstract: aLocalTypeAssign
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitLocalVoidAssign: aLocalVoidAssign [
	^ self visitAbstract: aLocalVoidAssign
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitMetadata: aMetadata [
	^ self visitAbstract: aMetadata
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitModule: aModule [
	^ self visitAbstract: aModule
]

{ #category : #generated }
LLVMAbstractNodeVisitor >> visitTargetDefinition: aTargetDefinition [
	^ self visitAbstract: aTargetDefinition
]
