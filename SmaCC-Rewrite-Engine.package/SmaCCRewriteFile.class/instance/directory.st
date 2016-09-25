accessing
directory
	^ filename asFileReference parent pathString
		, FileSystem disk delimiter asString