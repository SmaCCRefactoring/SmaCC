private
createDefaultClassesForSymbol: aString
	| className index |
	className := aString capitalized.
	[index := className indexOf: $_.
	index > 0 and: [className size > 1]]
		whileTrue:
			[className := (className copyFrom: 1 to: index - 1) , (className copyFrom: index + 1 to: className size) capitalized].
	className := className asSymbol.
	defaultClasses do: [:each | self createClass: className for: each].
	defaultClasses := OrderedCollection new