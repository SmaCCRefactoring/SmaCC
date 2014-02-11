private
setUp
	super setUp.
	SmaCCCodeGenerator reset.
	currentModifiedStatus := self package isDirty.
	self setUpClasses