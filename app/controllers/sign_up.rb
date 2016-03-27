class Chitter < Sinatra::Base

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = User.new(name: params[:name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect '/sign-up'
    end
  end
end