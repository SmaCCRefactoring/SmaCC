"
I apply an action from the debugger. I iterate as long as a test block isn't false.

Beware: I may deadlock the image if the block I'm using to move from one instruction to another never returns false.
"
Class {
	#name : #SmaCCDebuggingAction,
	#superclass : #DebugAction,
	#category : 'SmaCC-Debugging-Support'
}

{ #category : #testing }
SmaCCDebuggingAction >> appliesToContext: aContext [
	^ self session isActive
]

{ #category : #testing }
SmaCCDebuggingAction >> enabled [
	^ true
]

{ #category : #private }
SmaCCDebuggingAction >> stepUntil: aBlock [
	| context process originalContext |
	process := self session process.
	originalContext := self currentContext.
	context := originalContext.
	[ context notNil
		and: [ process isTerminating not
				and: [ process isTerminated not and: [ aBlock value: context ] ] ] ]
		whileFalse: [ context := process step: context ].
	self session updateWithContext: context fromProcess: process
]
