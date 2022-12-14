Class {
	#name : #PyDecoratedNode,
	#superclass : #PyRootNode,
	#instVars : [
		'decorators',
		'classdef',
		'funcdef'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyDecoratedNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDecorated: self
]

{ #category : #generated }
PyDecoratedNode >> classdef [
	^ classdef
]

{ #category : #generated }
PyDecoratedNode >> classdef: aPyClassdefNode [
	self classdef notNil
		ifTrue: [ self classdef parent: nil ].
	classdef := aPyClassdefNode.
	self classdef notNil
		ifTrue: [ self classdef parent: self ]
]

{ #category : #generated }
PyDecoratedNode >> decorators [
	^ decorators
]

{ #category : #generated }
PyDecoratedNode >> decorators: aPyDecoratorsNode [
	self decorators notNil
		ifTrue: [ self decorators parent: nil ].
	decorators := aPyDecoratorsNode.
	self decorators notNil
		ifTrue: [ self decorators parent: self ]
]

{ #category : #generated }
PyDecoratedNode >> funcdef [
	^ funcdef
]

{ #category : #generated }
PyDecoratedNode >> funcdef: aPyFuncdefNode [
	self funcdef notNil
		ifTrue: [ self funcdef parent: nil ].
	funcdef := aPyFuncdefNode.
	self funcdef notNil
		ifTrue: [ self funcdef parent: self ]
]

{ #category : #generated }
PyDecoratedNode >> nodeVariables [
	^ #(#decorators #classdef #funcdef)
]
