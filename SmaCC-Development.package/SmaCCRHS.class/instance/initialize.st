initialize-release
initialize
	super initialize.
	collection := OrderedCollection new.
	reduceAction := SmaCCDefaultReduceCode onRHS: self.
	variableNameMap := Dictionary new