"
this announcement contains a parser action and the parser state (stacks)
"
Class {
	#name : #SmaCCRAnnounce,
	#superclass : #Announcement,
	#instVars : [
		'stack',
		'nodeStack',
		'action'
	],
	#category : 'SmaCC-Development-Debug'
}

{ #category : #accessing }
SmaCCRAnnounce >> action [
	^ action
]

{ #category : #accessing }
SmaCCRAnnounce >> action: anObject [
	action := anObject
]

{ #category : #accessing }
SmaCCRAnnounce >> nodeStack [
	^ nodeStack
]

{ #category : #accessing }
SmaCCRAnnounce >> nodeStack: anObject [
	nodeStack := anObject
]

{ #category : #accessing }
SmaCCRAnnounce >> stack [
	^ stack
]

{ #category : #accessing }
SmaCCRAnnounce >> stack: anObject [
	stack := anObject
]
