Class {
	#name : #LLVMGlobalConstAssignNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'assign',
		'visibility',
		'thread',
		'type',
		'constant',
		'addrSpace',
		'_attributes',
		'internalLinkage'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMGlobalConstAssignNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> _attributes: aSmaCCToken [
	_attributes := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitGlobalConstAssign: self
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> addrSpace [
	^ addrSpace
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> addrSpace: anOrderedCollection [
	addrSpace := anOrderedCollection
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> assign [
	^ assign
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> assign: anOrderedCollection [
	assign := anOrderedCollection
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> constant [
	^ constant
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> constant: anOrderedCollection [
	constant := anOrderedCollection
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> internalLinkage [
	^ internalLinkage
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> internalLinkage: aSmaCCToken [
	internalLinkage := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> otherVariables [
	^ #(#assign #constant #addrSpace)
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> thread [
	^ thread
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> thread: aSmaCCToken [
	thread := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> tokenVariables [
	^ #(#visibility #thread #type #_attributes #internalLinkage)
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> type [
	^ type
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> type: aSmaCCToken [
	type := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> visibility [
	^ visibility
]

{ #category : #generated }
LLVMGlobalConstAssignNode >> visibility: aSmaCCToken [
	visibility := aSmaCCToken
]
