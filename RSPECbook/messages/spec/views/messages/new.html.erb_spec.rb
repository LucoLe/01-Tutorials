require 'rails_helper.rb'

describe "messages/new.html.erb" do
  let(:message) do
    mock_model("Message").as_new_record.as_null_object
  end
  before do
    assign(:message, message)
  end

  it "renders a form to create a message" do
    render
    expect(render).to have_selector('form',
      method: "post",
      action: messages_path) do |form|
        expect(form).to have_selector("input", type: "submit")
    end
  end

  it "renders a text field for the message title" do
    message.stub(title: "the title")
    render
    expect(render).to have_selector('form') do |form|
      expect(form).to have_selector("input",
        type: "text",
        name: "message[title]",
        value: "the title")
    end
  end

  it "renders a text area for the message text" do
    message.stub(text: "the message")
    render
    expect(render).to have_selector("form") do |form|
      expect(form).to have_selector("textarea",
        name: "message[text]",
        content: "the message")
    end
  end

end