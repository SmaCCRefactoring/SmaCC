examples
inspectingAmbiguousNotificationWithHalt
	<example>
	[ CGLRParser
		parse:
			'typedef int i;
void f() {
	i * i;
}' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | 
			self halt.
			ex resume: ex tag first ]