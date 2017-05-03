private
outputPane
	^ self previewPresentation first panes detect: [ :each | each name = #output ]