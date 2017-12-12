examples
inspectingAmbiguousNotification
	<example>
	[ CGLRParser
		parse:
			' void f(int i) {
	i * i;
} ' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | 
			ex inspect.
			ex resume: ex tag first ]