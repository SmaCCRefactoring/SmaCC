examples
inspectingAmbiguousNotificationWithHalt
	<example>
	[ CGLRParser
		parse:
			' void f(int i) {
	i * i;
} ' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | 
			self halt.
			ex inspect.
			ex resume: ex tag first ]