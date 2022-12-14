Class {
	#name : #LLVMGlobalAliasAssignNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'assign',
		'visibility',
		'aliasToken',
		'alias',
		'aliasee'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMGlobalAliasAssignNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitGlobalAliasAssign: self
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> alias [
	^ alias
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> alias: aSmaCCToken [
	alias := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> aliasToken [
	^ aliasToken
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> aliasToken: aSmaCCToken [
	aliasToken := aSmaCCToken
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> aliasee [
	^ aliasee
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> aliasee: anObject [
	aliasee := anObject
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> assign [
	^ assign
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> assign: anOrderedCollection [
	assign := anOrderedCollection
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> otherVariables [
	^ #(#assign #aliasee)
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> tokenVariables [
	^ #(#visibility #aliasToken #alias)
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> visibility [
	^ visibility
]

{ #category : #generated }
LLVMGlobalAliasAssignNode >> visibility: aSmaCCToken [
	visibility := aSmaCCToken
]
