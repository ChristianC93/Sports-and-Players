class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/sports" do
    Sport.all.to_json(include: [ :players ])
  end

  get "/sports/:id" do
    sport = Sport.find(params[:id])
    sport.to_json( only:[ :id, :name ], include: {
      players: { only:[ :name, :age, :active ] }
    })
  end
  
  post "/sports" do
    sport = Sport.find_or_create_by(
      name: params[:name]
    ) 
    sport.to_json
  end

  get "/players" do
    Player.all.to_json(include: [:sport]) 
  end

  get "/players/:id" do
    player = Player.find(params[:id])
    player.to_json(include: [:sport]) 
  end

  post "/players" do
    player = Player.create(
      name: params[:name],
      age: params[:age],
      active: params[:active],
      sport_id: params[:sport_id]
    )
    player.to_json
  end

  patch "/players/:id" do 
    player = Player.find(params[:id])
    player.update(
      name: params[:name],
      age: params[:age],
      active: params[:active],
      sport_id: params[:sport_id]
    )
    player.to_json
  end

  delete "/players/:id" do 
    player = Player.find(params[:id])
    player.destroy
    player.to_json
  end

end
