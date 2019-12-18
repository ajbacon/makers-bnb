require 'sinatra/activerecord'
require 'user'

describe User do
  context 'the user is created' do
    let(:test_user) { User.create({ email: 'abacon@test.com', password: 'pass1' }) }

    it 'has Email address' do
      expect(test_user.email).to eq 'abacon@test.com'
    end

    it 'has Password' do
      expect(test_user.password).to eq 'pass1'
    end 
  end
end
