require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#index' do
    subject { get :index }

    it 'should return success respons' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :article, 2
      subject
      # pp json
      expect(json_data.length).to eq(2)
      Article.recent.each_with_index do |article, index|
        expect(json_data[index]['attributes']).to eq({
          "title" => article.title,
          "content" => article.content,
          "slug" => article.slug
        })
      end
    end

    it 'should return articles in the proper order' do
      old_article = create :article
      newer_article = create :article
      subject
      expect(json_data.first["id"]).to eq(newer_article.id.to_s)
      expect(json_data.last["id"]).to eq(old_article.id.to_s)
    end
  end
end
