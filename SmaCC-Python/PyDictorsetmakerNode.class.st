Class {
	#name : #PyDictorsetmakerNode,
	#superclass : #PyRootNode,
	#instVars : [
		'test',
		'colonToken',
		'test2',
		'comp',
		'more'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyDictorsetmakerNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDictorsetmaker: self
]

{ #category : #generated }
PyDictorsetmakerNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyDictorsetmakerNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyDictorsetmakerNode >> comp [
	^ comp
]

{ #category : #generated }
PyDictorsetmakerNode >> comp: aPyCompForNode [
	self comp notNil
		ifTrue: [ self comp parent: nil ].
	comp := aPyCompForNode.
	self comp notNil
		ifTrue: [ self comp parent: self ]
]

{ #category : #generated }
PyDictorsetmakerNode >> more [
	^ more
]

{ #category : #generated }
PyDictorsetmakerNode >> more: anObject [
	more := anObject
]

{ #category : #generated }
PyDictorsetmakerNode >> nodeVariables [
	^ #(#test #test2 #comp)
]

{ #category : #generated }
PyDictorsetmakerNode >> otherVariables [
	^ #(#more)
]

{ #category : #generated }
PyDictorsetmakerNode >> test [
	^ test
]

{ #category : #generated }
PyDictorsetmakerNode >> test2 [
	^ test2
]

{ #category : #generated }
PyDictorsetmakerNode >> test2: aPyRootNode [
	self test2 notNil
		ifTrue: [ self test2 parent: nil ].
	test2 := aPyRootNode.
	self test2 notNil
		ifTrue: [ self test2 parent: self ]
]

{ #category : #generated }
PyDictorsetmakerNode >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]

{ #category : #generated }
PyDictorsetmakerNode >> tokenVariables [
	^ #(#colonToken)
]
