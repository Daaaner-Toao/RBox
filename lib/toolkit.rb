module Toolkit

	# to remedy all UTF-8 issues, which surely come up on an international platform
	def utf_sanitizer(text)
		text = text=text.force_encoding('utf-8').encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '') 
	end

	# parser for elements from the CRAN/PACKAGES page (for single package informations)
	def cran_value_regex(key,text,fallback = "")
		(utf_sanitizer(text)[/(?<=#{key}: ).*?(?=^([\w\-]+))/m]).nil? ? fallback : utf_sanitizer(text)[/(?<=#{key}: ).*?(?=^([\w\-]+))/m].strip.gsub("\n","").gsub(/\s+/, " ")
	end

	# takes a unsanitized package from the cran page and build has values from it (other values can easily made accessable by adding them to the array)
    def hashed(cran_package) 
      elements = Hash.new
      ["Package","Version"].each {|key| elements[key.downcase.to_sym] = cran_value_regex(key,cran_package)  }
      elements
    end

    def create_package(hash)
      @package = Package.create(name: hash[:package], versions: [ hash[:version] ])
    end

end