public
showNotifyView
	"Correct. Show the menu each time you click in the window, collapses the window in the taskbar."

	notifyView := StringMorph new.
	notifyView contents: self notifyMessage.
	notifyView on: #mouseDown send: #showTrayMenu to: self.
	(window := notifyView openInWindowLabeled: self title)
		onAnnouncement: WindowClosed send: #exit to: self;
		collapse