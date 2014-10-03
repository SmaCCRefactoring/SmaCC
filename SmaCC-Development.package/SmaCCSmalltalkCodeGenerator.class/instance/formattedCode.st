private
formattedCode
	^ (RBParser parseMethod: self codeStream contents) formattedCode