private
isAmbiguous: action
	^ (action bitAnd: self actionMask) = 2r11