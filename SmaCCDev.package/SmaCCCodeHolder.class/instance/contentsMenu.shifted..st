menus
contentsMenu: aMenu shifted: shifted 
	"Note that unless we override perform:orSendTo:,  
	PluggableTextController will respond to all menu items in a text pane"
	| selections labelsString linesArray |
	selections := #(#find #findAgain #setSearchString #again #undo #copySelection #cut #paste #pasteRecent #accept #cancel #saveContentsInFile #readContentsFromFile ).
	labelsString := 'find...(f)\find again (g)\set search string (h)\do again (j)\undo (z)\copy (c)\cut (x)\paste (v)\paste...\accept (s)\cancel (l)\save contents in file...\read contents from file...' withCRs.
	linesArray := #(3 5 9 11 14).
	^ aMenu
		labels: labelsString
		lines: linesArray
		selections: selections