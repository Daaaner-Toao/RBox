module Toolkit

	# to remedy all UTF-8 issues, which surely come up on an international platform
	def utf_sanitizer(text)
		text = text=text.force_encoding('utf-8').encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '') 
	end

	# parser for elements from the CRAN/PACKAGES page (for single package informations)
	def cran_value_regex(key,text,fallback = "")
		(utf_sanitizer(text)[/(?<=#{key}: ).*?(?=^([\w\-]+))/m]).nil? ? fallback : utf_sanitizer(text)[/(?<=#{key}: ).*?(?=^([\w\-]+))/m].strip.gsub("\n","").gsub(/\s+/, " ")
	end

end