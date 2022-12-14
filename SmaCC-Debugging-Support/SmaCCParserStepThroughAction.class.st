"
I step either past the end of the current parser #performAction: or to the start of the next #performAction:
"
Class {
	#name : #SmaCCParserStepThroughAction,
	#superclass : #SmaCCParserStepAction,
	#category : 'SmaCC-Debugging-Support'
}

{ #category : #registration }
SmaCCParserStepThroughAction class >> gtActionFor: aDebugger [
	<gtSmaCCDebuggingParserAction>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #accessing }
SmaCCParserStepThroughAction >> defaultLabel [
	^ 'Through Action'
]

{ #category : #accessing }
SmaCCParserStepThroughAction >> defaultOrder [
	^ 1
]

{ #category : #accessing }
SmaCCParserStepThroughAction >> executeAction [
	| insidePerform performBlock |
	performBlock := [ :context | 
	(context receiver isKindOf: SmaCCParser)
		and: [ context selector = #performAction: ] ].
	insidePerform := (self session context
		findContextSuchThat: performBlock) notNil.
	self
		stepUntil: [ :context | 
			(context
				findContextSuchThat:
					[ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #parse ] ])
				isNil
				or: [ insidePerform
						ifTrue: [ (context findContextSuchThat: performBlock) isNil ]
						ifFalse: [ insidePerform := performBlock value: context.
							false ] ] ]
]

{ #category : #accessing }
SmaCCParserStepThroughAction >> help [
	^ 'Step until the next parser action'
]
