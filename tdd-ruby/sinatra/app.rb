require "haml"
require "pstore"
require_relative "../lib/team.rb"
require_relative "../lib/competition.rb"

class App < Sinatra::Base

  before { load_db }

  get "/" do
    "Hello World"
  end

  get "/teams/new" do
    haml :"teams/new"
  end

  post "/teams" do
    @team = Team.new(params[:name])
    save_team @team

    redirect "/teams/success"
  end

  get "/teams/:id/enter_competition" do
    index = params[:has_questions] == "true" ? 1 : 0
    competition = nil

    @db.transaction do
      competition = @db[competitions][index]
      @team = @db[:team]
    end
    begin
      @team.enter_competition competition
      200
    rescue Competition::Closed
      403
    end
  end

  get "/teams/success" do
    @db.transaction {@team = @db[:team]}
    haml :"teams/success"
  end

  private

    def load_db
      @db = PStore.new("store")

      @db.transaction do
        @db[:competitions] ||= [
          Competition.new,
          Competition.new(["Question 1"])
        ]
      end
    end

    def save_team team
      @db.transaction do
        @db[:team] = team
      end
    end
end