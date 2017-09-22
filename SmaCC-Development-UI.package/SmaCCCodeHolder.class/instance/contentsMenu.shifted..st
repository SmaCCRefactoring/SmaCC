menus
contentsMenu: aMenu shifted: shifted
	^aMenu addList: #(
		('find...(f)' find)
		('find again (g)' findAgain)
		('set search string (h)' setSearchString)
		-
		('do again (j)' again)
		('undo (z)' undo)
		-
		('copy (c)' copy)
		('cut (x)' cut)
		('paste (v)' paste)
		('paste...' pasteRecent)
		-
		('accept (s)' accept)
		('cancel (l)' cancel)
		-
		('browse versions' versions)
		('save contents in file...' saveContentsInFile)
		('read contents from file...' readContentsFromFile) )
		
