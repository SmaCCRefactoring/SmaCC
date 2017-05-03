accessing
selectedFile
	^ ((self pane port: #selection) value
		ifNotNil: [ :selection | 
			"Hack to work around selection changing from value to array with value"
			selection isArray
				ifTrue: [ selection notEmpty
						ifTrue: [ selection first ] ]
				ifFalse: [ selection ] ]) ifNil: [ self result filename ]