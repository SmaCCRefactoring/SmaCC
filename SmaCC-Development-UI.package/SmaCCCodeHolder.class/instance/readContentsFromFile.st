menus
readContentsFromFile

	| result |
	(result := UIManager default
		   chooseExistingFileReference: 'Choose file to open'
		   extensions: nil
		   path: FileSystem workingDirectory
		   preview: nil) ifNotNil: [
		self contents: result contents.
		self changed: #contents ]