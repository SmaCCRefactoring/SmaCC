accessing
value
	^ host stateStack collect: [ :e | host symbolNames at: e ]