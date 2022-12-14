Class {
	#name : #LLVMGlobalTypeAssignNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'assign',
		'externalLinkage',
		'visibility',
		'thread',
		'type',
		'types',
		'addrSpace',
		'_attributes'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMGlobalTypeAssignNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> _attributes: aSmaCCToken [
	_attributes := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitGlobalTypeAssign: self
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> addrSpace [
	^ addrSpace
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> addrSpace: anOrderedCollection [
	addrSpace := anOrderedCollection
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> assign [
	^ assign
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> assign: anOrderedCollection [
	assign := anOrderedCollection
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> externalLinkage [
	^ externalLinkage
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> externalLinkage: aSmaCCToken [
	externalLinkage := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> otherVariables [
	^ #(#assign #types #addrSpace)
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> thread [
	^ thread
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> thread: aSmaCCToken [
	thread := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> tokenVariables [
	^ #(#externalLinkage #visibility #thread #type #_attributes)
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> type [
	^ type
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> type: aSmaCCToken [
	type := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> types [
	^ types
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> types: anOrderedCollection [
	types := anOrderedCollection
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> visibility [
	^ visibility
]

{ #category : #generated }
LLVMGlobalTypeAssignNode >> visibility: aSmaCCToken [
	visibility := aSmaCCToken
]
