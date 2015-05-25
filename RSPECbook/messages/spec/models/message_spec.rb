require 'rails_helper'

describe Message, type: :model do
  before(:each) do
    @message = Message.new(
      title: "foo",
      text: "bar",
      recipient: mock_model("User")
    )
  end

  it "is valid with valid attributes" do
    expect(@message).to be_valid
  end

  it "is not valid without a title" do
    @message.title = nil
    expect(@message).to_not be_valid
  end

  it "is not valid without text" do
    @message.text = nil
    expect(@message).to_not be_valid
  end

  it "is not valid without a recipient" do
    @message.recipient = nil
    expect(@message).to_not be_valid
  end
end
