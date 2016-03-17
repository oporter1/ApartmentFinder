require 'rails_helper'

RSpec.describe "apartments/new", type: :view do
  before(:each) do
    assign(:apartment, Apartment.new(
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "MyString",
      :name => "MyString",
      :contact => "MyString"
    ))
  end

  it "renders new apartment form" do
    render

    assert_select "form[action=?][method=?]", apartments_path, "post" do

      assert_select "input#apartment_latitude[name=?]", "apartment[latitude]"

      assert_select "input#apartment_longitude[name=?]", "apartment[longitude]"

      assert_select "input#apartment_address[name=?]", "apartment[address]"

      assert_select "input#apartment_name[name=?]", "apartment[name]"

      assert_select "input#apartment_contact[name=?]", "apartment[contact]"
    end
  end
end
