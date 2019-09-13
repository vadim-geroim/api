require 'rails_helper'

describe 'article routes' do
  it 'should rout to article index' do
    expect(get '/articles').to route_to('articles#index')
  end
  it 'should rout to article show' do
    expect(get '/articles/1').to route_to('articles#show', id: '1')
  end
end