private
parseAndEvaluate: aBlock
	| class |
	class := self parserClass.
	class isNil
		ifTrue: [ ^ UIManager default alert: 'No parser defined' ].
	aBlock
		value:
			(class
				parse: testModel text asString
				onError:
					[ :aString :position | 
					tabModel selectedTab: tabModel tabs last.
					self displayError: aString at: position.
					^ self ])