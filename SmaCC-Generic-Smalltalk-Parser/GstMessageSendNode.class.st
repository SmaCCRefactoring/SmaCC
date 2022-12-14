Class {
	#name : #GstMessageSendNode,
	#superclass : #GstValueNode,
	#instVars : [
		'receiver',
		'message'
	],
	#category : 'SmaCC-Generic-Smalltalk-Parser'
}

{ #category : #generated }
GstMessageSendNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMessageSend: self
]

{ #category : #generated }
GstMessageSendNode >> message [
	^ message
]

{ #category : #generated }
GstMessageSendNode >> message: aGstMessageNode [
	self message notNil
		ifTrue: [ self message parent: nil ].
	message := aGstMessageNode.
	self message notNil
		ifTrue: [ self message parent: self ]
]

{ #category : #generated }
GstMessageSendNode >> nodeVariables [
	^ #(#receiver #message)
]

{ #category : #generated }
GstMessageSendNode >> receiver [
	^ receiver
]

{ #category : #generated }
GstMessageSendNode >> receiver: aGstValueNode [
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aGstValueNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]
]
