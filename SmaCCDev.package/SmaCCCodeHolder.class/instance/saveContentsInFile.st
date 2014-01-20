menus
saveContentsInFile
	| result |
	(result := UITheme current
		fileSaveIn: World
		title: 'Choose file to open' translated
		extensions: nil
		path: FileSystem workingDirectory)
		ifNotNil: [ 
			result asFileReference exists
				ifTrue: [ ^ UIManager default inform: ' ' , result , ' already exists ' ].
			result asFileReference writeStream nextPutAll: contents.
			self changed: #contents ]