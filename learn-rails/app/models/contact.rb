class Contact

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :content

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :content
  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :content, :maximum => 500

  def update_spreadsheet
    require "rubygems"
    require "google/api_client"
    require "google_drive"

    # Authorizes with OAuth and gets an access token.
    client = Google::APIClient.new
    auth = client.authorization
    auth.client_id = ENV["DRIVE_CLIENT_ID"]
    auth.client_secret = ENV["DRIVE_CLIENT_SECRET"]
    auth.scope =
        "https://docs.google.com/feeds/" +
        "https://www.googleapis.com/auth/drive " +
        "https://spreadsheets.google.com/feeds/"
    auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
    print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
    print("2. Enter the authorization code shown in the page: ")
    auth.code = $stdin.gets.chomp
    auth.fetch_access_token!
    access_token = auth.access_token

    # Creates a session.
    connection = GoogleDrive.login_with_oauth(access_token)

    # Create or edit a spreadsheet
    ss = connection.spreadsheet_by_title('Learn-Rails-Example' )
    if ss.nil?
      ss = connection.create_spreadsheet('Learn-Rails-Example' )
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.new
    ws[last_row, 2] = self.name
    ws[last_row, 3] = self.email
    ws[last_row, 4] = self.content
    ws.save
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end