actions
saveToFile
	| result |
	self definitionTextModel acceptEdits.
	(result := UIManager default
		chooseForSaveFileReference: 'Choose a file to save the grammar as text'
		extensions: #('.txt')
		path: FileSystem workingDirectory)
		ifNotNil: [ result asFileReference exists
				ifTrue: [ ^ UIManager default inform: ' ' , result , ' already exists ' ].
			result asFileReference
				writeStreamDo: [ :s | s nextPutAll: self definitionTextModel text asString ].
			self changed: #contents ]