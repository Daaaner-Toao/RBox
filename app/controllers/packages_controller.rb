class PackagesController < ApplicationController
  include Toolkit # located in lib folder, provides reusable functions across model and controller


  # GET /packages || packages.json 
  def index

    respond_to do |format|
      format.html do 
        #@packages = Package.paginate(:page => params[:page],:per_page => 50)
        @packages, @alphaParams = Package.all.alpha_paginate(params[:letter],{js: false, default_field: "a"}){|p| p.name}
        @count = Package.count
        @complete = @count - Package.where(authors: nil).count
      end
      format.json {@packages = Package.all}
    end
  end

  # GET /packages/1.json left only json compatibility as another show is not required
  # all additional information are present in the package table
  def show
     @package = Package.find(params[:id])
  end

  # TODO create and update should be merged, both do nearly the same
  def create
    update_from_cran
    Package.delay.update_additional_details
    render nothing: true
  end

  def update 
    Package.delay.update_additional_details # manual update starter
    render nothing: true
  end

  private
    # TODO needs to moved to the model,  so that the delay function is used the same way
    # over and over again / and the controller stays clean
    def update_from_cran
      # get packages overview from cran & split the content into single packages
      cran_packages  = open('http://cran.r-project.org/src/contrib/PACKAGES') {|f| f.read }.split("\n\n")

      # for every package 
      cran_packages.each do |cran_pck|
    
        next if cran_pck.empty? # fallback if empty element occurs

        # hashed sanitizes the package as a hash following elements package(name),version,depends,license
        elements = hashed(cran_pck)
        # check if package already exists with version
        pck = Package.find_by_name(elements[:package])

        if pck.nil?
          create_package(elements) # creates a new record in the DB if no record exists
        else
          pck.add_to_array(elements[:version]) unless pck.versions.include?(elements[:version]) # add version if not in record
        end
      end
      Package.delay.update_additional_details
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
