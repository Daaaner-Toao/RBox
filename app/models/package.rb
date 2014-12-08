class Package < ActiveRecord::Base
	include Toolkit
	serialize :versions, Array



	# creates the url of the package for the given version
	def url(version=self.versions[-1])
		return "http://cran.r-project.org/src/contrib/#{self.name}_#{version}.tar.gz"
	end

	def get_description_file
		`curl  #{self.url} | tar -xvOf  - #{self.name}/DESCRIPTION`
	end

	def get_publication_date(description)
		raw = utf_sanitizer(description)[/(?<=Date\/Publication:).*/m]
		if raw.nil?
			raw = cran_value_regex("Date", description) || cran_value_regex("Published", description) # unfortunatily the naming pattern is not stable
		end 
		raw.strip.gsub("\n","").gsub(/\s+/, " ")
	end

	def add_to_array(value)
		self.versions << value
		self.save		
	end

	def self.update_additional_details

      self.all.each do |p| 
        description = p.get_description_file
        next if p.publication == p.get_publication_date(description)
        if p.publication.nil? || p.publication < p.get_publication_date(description) || p.authors.nil?
          p.update_details(description)
        end
      end
    end


	# function for updating the additional information author/maintainer Description
	def update_details(description)
		self.title = self.cran_value_regex("Title",description)
		self.publication = self.get_publication_date(description)
		self.description = self.cran_value_regex("Description",description)
		self.authors = self.cran_value_regex("Author",description)
		self.maintainers = self.cran_value_regex("Maintainer",description)
		self.updated_at = Time.now	
		self.save
	end
    

end
