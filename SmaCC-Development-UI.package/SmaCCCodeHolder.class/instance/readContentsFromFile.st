menus
readContentsFromFile
	| result |
	(result := UITheme current fileOpenIn: World title: 'Choose file to open' extensions: nil path: FileSystem workingDirectory preview: nil)
		ifNotNil: [
			self contents: result contents.
			self changed: #contents ]