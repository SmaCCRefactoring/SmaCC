menus
saveContentsInFile
	| result |
	(result := self theme
		chooseForSaveFileReference: 'Choose file to save'
		extensions: nil
		path: FileSystem workingDirectory)
			ifNotNil: [ result asFileReference exists
				ifTrue: [ ^ UIManager default inform: ' ' , result , ' already exists ' ].
			result asFileReference
				writeStreamDo: [ :s | s nextPutAll: contents ].
			self changed: #contents ]