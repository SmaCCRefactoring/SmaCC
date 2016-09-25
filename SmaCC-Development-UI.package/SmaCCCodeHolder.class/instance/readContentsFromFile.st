menus
readContentsFromFile
	| result |
	(result := UIManager default chooseFileMatching: nil label: 'Choose file to open' translated)
		ifNotNil: [ 
			result asFileReference exists
				ifFalse: [ ^ UIManager default inform: ' ' , result , ' doesn''t exists ' ].
			self acceptContents: result asFileReference readStream contents.
			self changed: #contents ]