"
I step forward until I reach a reduction semantic action
"
Class {
	#name : #SmaCCParserStepToReduceAction,
	#superclass : #SmaCCParserStepAction,
	#category : 'SmaCC-Debugging-Support'
}

{ #category : #registration }
SmaCCParserStepToReduceAction class >> gtActionFor: aDebugger [
	<gtSmaCCDebuggingParserAction>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #accessing }
SmaCCParserStepToReduceAction >> defaultLabel [
	^ 'Into Reduce'
]

{ #category : #accessing }
SmaCCParserStepToReduceAction >> defaultOrder [
	^ 50
]

{ #category : #accessing }
SmaCCParserStepToReduceAction >> executeAction [
	| selectors |
	selectors := self session parser reduceTable
		inject: Set new
		into: [ :sum :each | 
			sum
				add: each last;
				yourself ].
	self
		stepUntil: [ :context | 
			(context
				findContextSuchThat:
					[ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #parse ] ])
				isNil
				or: [ (context
						findContextSuchThat: [ :each | 
							(each receiver isKindOf: SmaCCParser)
								and: [ selectors includes: each selector ] ]) notNil ] ]
]

{ #category : #accessing }
SmaCCParserStepToReduceAction >> help [
	^ 'Step until the next reduction action'
]
