require 'spec_helper'

describe "ValueInquiry pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "ValueInquiry creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a ValueInquiry" do
        expect { click_button "Submit" }.not_to change(value_inquiry, :count)
      end

      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'value_inquiry_content', with: "Lorem ipsum" }
      it "should create a value_inquiry" do
        expect { click_button "Submit" }.to change(ValueInquiry, :count).by(1)
      end
    end
  end
end
