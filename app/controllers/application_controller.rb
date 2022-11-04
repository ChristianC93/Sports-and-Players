class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/sports" do
    Sport.all.to_json(include:[:players])
  end

  get "/sports/:id" do
    sport = Sport.find(params[:id])
    sport.to_json(only:[ :id, :name ], include: {
      players: {only:[ :name, :age, :active ]}
    })
  end 

end
