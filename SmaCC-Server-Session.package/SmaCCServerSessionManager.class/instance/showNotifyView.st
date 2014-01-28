public
showNotifyView
	"TODO: This is probably incorrect."

	notifyView := StringMorph new.
	notifyView create.
	notifyView notifyIcon: self notifyIcon tipMessage: self notifyMessage.
	notifyView when: #onRightButtonPressed send: #showTrayMenu to: self