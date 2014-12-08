require 'rails_helper'

RSpec.describe "packages/index", :type => :view do
  before(:each) do
    assign(:packages, [
      Package.create!(
        :name => "Name",
        :versions => "MyText",
        :title => "Title",
        :description => "MyText"
      ),
      Package.create!(
        :name => "Name",
        :versions => "MyText",
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of packages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
