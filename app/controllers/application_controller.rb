class ApplicationController < Sinatra::Base

  # add routes

  set default_content_type: "application/json"

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get 'baked_goods/most_expenive' do
    baked_goods = BakedGood.all.limit(1).order(price: :desc)[0]
    baked_goods.to_json
  end

end
