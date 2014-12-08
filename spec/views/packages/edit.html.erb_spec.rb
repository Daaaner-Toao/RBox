require 'rails_helper'

RSpec.describe "packages/edit", :type => :view do
  before(:each) do
    @package = assign(:package, Package.create!(
      :name => "MyString",
      :versions => "MyText",
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit package form" do
    render

    assert_select "form[action=?][method=?]", package_path(@package), "post" do

      assert_select "input#package_name[name=?]", "package[name]"

      assert_select "textarea#package_versions[name=?]", "package[versions]"

      assert_select "input#package_title[name=?]", "package[title]"

      assert_select "textarea#package_description[name=?]", "package[description]"
    end
  end
end
