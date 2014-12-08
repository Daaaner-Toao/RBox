module PackagesHelper

	# Split name and email to create a mail_to element 
	def email_name(name)
		unless name.nil?
			email = name[/(?<=<)(.*)(?=>)/].strip unless name[/(?<=<)(.*)(?=>)/].nil?
			name = name[/(.*)(?=<)/].strip unless name[/(.*)(?=<)/].nil?
			mail_to(email,"#{name} - #{email} ")
		end
	end

	# Time formatting 
	def time_format(time)
		time.strftime("%D-%H:%M ") unless time.nil?
	end

end
