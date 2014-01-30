require 'spec_helper'

describe ValueInquiry do
	let(:user) { FactoryGirl.create(:user) }
	before do
    # This code is not idiomatically correct.
    @value_inquiry = user.value_inquiry.build(karat: "22", weight: "2", market_price: "36.94", value: "73.88")
	end

	subject { @value_inquiry }

	it { should respond_to(:karat) }
	it { should respond_to(:weight) }
	it { should respond_to(:market_price) }
	it { should respond_to(:value) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
  its(:user) { should eq user }

	it { should be_valid }

  describe "when user_id is not present" do
    before { @value_inquiry.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank karat" do
    before { @value_inquiry.karat = " " }
    it { should_not be_valid }
  end

  describe "with karat that is too long" do
    before { @value_inquiry.karat = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with blank weight" do
    before { @value_inquiry.weight = " " }
    it { should_not be_valid }
  end

  describe "with weight that is too long" do
    before { @value_inquiry.weight = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with blank market_price" do
    before { @value_inquiry.market_price = " " }
    it { should_not be_valid }
  end

  describe "with market_price that is too long" do
    before { @value_inquiry.market_price = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with blank value" do
    before { @value_inquiry.value = " " }
    it { should_not be_valid }
  end

  describe "with value that is too long" do
    before { @value_inquiry.value = "a" * 141 }
    it { should_not be_valid }
  end
  
end
