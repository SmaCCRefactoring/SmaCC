Class {
	#name : #SmaCCTransformationToolkitDebugAction,
	#superclass : #DebugAction,
	#category : 'SmaCC-Rewrite-Engine-UI'
}

{ #category : #testing }
SmaCCTransformationToolkitDebugAction >> appliesToContext: aContext [
	^ self session isActive
]

{ #category : #private }
SmaCCTransformationToolkitDebugAction >> stepUntil: aBlock [
	| context process originalContext searchBlock transformationBlock |
	searchBlock := SmaCCRewriteMatch haltBlock.
	transformationBlock := SmaCCRewriteTransformation haltBlock.
	SmaCCRewriteMatch haltBlock: nil.
	SmaCCRewriteTransformation haltBlock: nil.
	[ process := self session process.
	originalContext := self currentContext.
	context := originalContext.
	[ self session isActive not
		or: [ context notNil and: [ process isTerminating not and: [ process isTerminated not and: [ aBlock value: context ] ] ] ] ]
		whileFalse: [ context := process step: context ].
	self session updateWithContext: context fromProcess: process ]
		ensure: [ SmaCCRewriteMatch haltBlock: searchBlock.
			SmaCCRewriteTransformation haltBlock: transformationBlock ]
]
