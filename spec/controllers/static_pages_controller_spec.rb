require 'rails_helper'

describe StaticPagesController, type: :controller do
	context 'GET #index' do
		it 'renders the index template' do
			get :index
			expect(response).to have_http_status(200)
			expect(response).to render_template('index')
		end
	end
end