menus
saveContentsInFile
	| result |
	(result := UIManager default
		chooseForSaveFileReference: 'Choose file to save'
		extensions: nil
		path: FileSystem workingDirectory)
			ifNotNil: [ result asFileReference exists
				ifTrue: [ ^ UIManager default inform: ' ' , result , ' already exists ' ].
			result asFileReference
				writeStreamDo: [ :s | s nextPutAll: contents asString ].
			self changed: #contents ]