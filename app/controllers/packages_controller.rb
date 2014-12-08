class PackagesController < ApplicationController
  include Toolkit # located in lib folder, provides reusable functions across model and controller


  # GET /packages || packages.json || packages?letter=
  def index

    respond_to do |format|
      format.html do 
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

  # Create update is used to laverage the general creation/update process
  # which is also scheduled for 12pm daily. 
  def create
    update_from_cran
    render nothing: true
  end

  # Manually refresh information of a package, if not yet loaded
  def update 
    package = Package.find(params[:id])
    package.update_details
    redirect_to :back
  end


  private

    # This is the actual logic parsing the PACKAGES file and run the update_details
    # method for DESCRIPTION file attributes as needed
    def update_from_cran

      # get packages overview from cran & split the content into single packages
      cran_packages  = open('http://cran.r-project.org/src/contrib/PACKAGES') {|f| f.read }.split("\n\n")

      # for every package 
      cran_packages.each do |cran_pck|
    
        next if cran_pck.empty? # fallback if empty element occurs

        # hashed sanitizes the package into a hash - it is found in the lib/toolkit file
        elements = hashed(cran_pck)

        # check if package already exists with version
        pck = Package.find_by_name(elements[:package])

        if pck.nil? # cran package not yet in db
          newPck = create_package(elements) # creates a new record 
          newPck.delay.update_details # asynchronously update details / "rake jobs:work" should be running 

        elsif !pck.versions.include?(elements[:version]) # if version is not yet in db for this package
          newPck = pck.add_to_array(elements[:version])   # add version to package
          newPck.delay.update_details # check for updated information          
        end
      end
    end

end
