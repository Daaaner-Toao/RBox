require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PackagesController, :type => :controller do


  # This should return the minimal set of attributes required to create a valid
  # Package. As you add validations to Package, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {"name"=>"A3", 
    "authors"=>"Scott Fortmann-Roe", 
    "maintainers"=>"Scott Fortmann-Roe <scottfr@berkeley.edu>", 
    "versions"=>["0.9.2"], 
    "publication"=>"Tue, 26 Mar 2013 19:58:40 UTC +00:00", 
    "title"=>"A3: Accurate, Adaptable, and Accessible Error Metrics for Predictive Models", 
    "description"=>"This package supplies tools for tabulating and analyzing the results of predictive models. The methods employed are applicable to virtually any predictive model and make comparisons between different methodologies straightforward.", 
    "created_at"=> "Mon, 08 Dec 2014 08:54:29 UTC +00:00", 
    "updated_at"=> "Mon, 08 Dec 2014 08:56:36 UTC +00:00" }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PackagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all packages as @packages" do
      package = Package.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:packages)).to eq([package])
    end
  end

  describe "count CRAN" do
    before do
      @cran_packages_count = open('http://cran.r-project.org/src/contrib/PACKAGES') {|f| f.read }.split("\n\n").length
    end

    it "Count of cran should be 6000+" do
      @cran_packages_count.should be > 6000
    end
  end


end
