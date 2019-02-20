*smacc-debugging-support
sourceFilesIn: aDirectory
	^ aDirectory asFileReference allFiles
		select: [ :each | 
			| extension |
			extension := '.' , each extension.
			self fileExtensions includes: extension ]