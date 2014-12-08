require 'rails_helper'

RSpec.describe "packages/show", :type => :view do
  before(:each) do
    @package = assign(:package, Package.create!(
      :name => "Name",
      :versions => "MyText",
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
