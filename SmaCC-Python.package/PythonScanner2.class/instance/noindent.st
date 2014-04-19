private
noindent
	"We should revert to the beginning of the scan."

	self state: #default.
	stream position: stream position - outputStream contents size.
	^ self next