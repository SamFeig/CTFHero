require 'sinatra'
require 'pg'

enable :inline_templates

get '/' do
  '<title>No Page</title>
<h1>Please access the home page</h1>
<a href="/home">Home Page</a>'
end

get '/home' do
  '<title>Home Page</title>
<h1>Please login</h1>
<form action="JavaScript:Login()" method="post" name="loginForm">
<label>Username:</label>
<input type="text" name="username" id="username" value="donutsAreGr8" />
<label>Password :</label>
<input type="password" name="pin" id="pin" value="butChocolateIsBetter" />
<input type="button" name="submitForm" id="btn" value="Login" onclick="Login()"/>
</form>
<p id="output"></p>
<script>
function Login(){
  var username = document.getElementById("username").value;
  var pin = document.getElementById("pin").value;
  window.location.assign("/login/" + username + "/" + pin);
}
</script>'
end

get '/login/:username/:pin' do
  if params['username'].to_s.eql? 'donutsAreGr8'
    if params['pin'].to_s.eql? 'butChocolateIsBetter'
      '<title>Hold On</title>
It looks like this is your first time logging on from this computer.<br>
Please answer the following:<br><br><br>
<form action="/login/donutsAreGr8/butChocolateIsBetter" method="post">
What was the maiden name of your grandmother?<br>
<input type="text" name="secQ1"><br><br>
What is the sum of the ages of your parents, divided by your age when you had your first child, to the power of
how many children you have?<br>
<input type="text" name="secQ2"><br><br>
<input type="submit" value="Submit">
</form>'
    else
      redirect '/home'
    end
  else
    redirect '/home'
  end
end

post '/login/donutsAreGr8/butChocolateIsBetter' do
  if params['secQ1'].nil?
    if params['secQ2'].nil?
      '<title>Welcome</title>
Welcome donutsAreGr8!<br>
As thanks for using our website please accept this flag, MCA{Igkqs1Pn5w}.'
    else
      '<title>Incorrect</title>
Please click <a href="/home">here</a> to try logging in again.'
    end
  else
    '<title>Incorrect</title>
Please click <a href="/home">here</a> to try logging in again.'
  end
end

get '/*' do
  redirect '/'
end