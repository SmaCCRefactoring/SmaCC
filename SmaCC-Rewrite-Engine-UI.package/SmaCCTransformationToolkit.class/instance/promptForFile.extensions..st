private
promptForFile: aTitle extensions: anArray
	^ UITheme current
		chooseFullFileNameIn: UITheme builder
		title: aTitle
		extensions: anArray
		path: nil
		preview: nil