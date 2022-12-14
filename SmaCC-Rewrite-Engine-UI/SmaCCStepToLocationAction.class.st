Class {
	#name : #SmaCCStepToLocationAction,
	#superclass : #SmaCCTransformationToolkitDebugAction,
	#category : 'SmaCC-Rewrite-Engine-UI'
}

{ #category : #registration }
SmaCCStepToLocationAction class >> gtActionFor: aDebugger [
	<gtSmaCCTransformationInput>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #accessing }
SmaCCStepToLocationAction >> defaultKeymap [
	^ $c meta
]

{ #category : #accessing }
SmaCCStepToLocationAction >> defaultLabel [
	^ 'Run to Cursor'
]

{ #category : #accessing }
SmaCCStepToLocationAction >> defaultOrder [
	^ 100
]

{ #category : #accessing }
SmaCCStepToLocationAction >> executeAction [
	| first node interval nextNode |
	first := true.
	interval := self debugger currentInputSelectionInterval.
	node := self session currentNode.
	self
		stepUntil: [ :context | 
			first
				ifTrue: [ first := false ]
				ifFalse: [ context isBlockContext not
						and: [ (self session isRewriteContext: context)
								and: [ node ~~ (nextNode := context receiver match)
										and: [ (interval first between: nextNode startPosition and: nextNode stopPosition)
												or:
													[ (interval last between: nextNode startPosition and: nextNode stopPosition) or: [ nextNode startPosition between: interval first and: interval last ] ] ] ] ] ] ]
]
