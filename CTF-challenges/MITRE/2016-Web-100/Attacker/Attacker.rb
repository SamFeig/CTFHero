require 'sinatra'

before do
  headers['Access-Control-Allow-Credentials'] = 'true'
  headers['Access-Control-Allow-Origin'] = 'http://10.0.1.22'
end

get '/' do
  '<title>Hacker\'s Home</title>'
end

get '/whereISend/:stuff' do
  if params['stuff'].to_s[0..3].eql? 'allYourPasswordsAndStuff'
    redirect '/'
  else
    '<title>Hacker\'s Home</title>
Congratulations on finding where I send all your passwords and stuff. <br>
Have this as a reward MCA-19C34A41'
  end
end

get '/*' do
  redirect '/'
end