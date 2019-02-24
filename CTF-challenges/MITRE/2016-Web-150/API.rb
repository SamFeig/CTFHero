require 'sinatra'

get '/' do
  '<title>No Page</title>
<h1>Please access the home page</h1>
<a href="/home">Home Page</a>
<h3>Popular Users</h3>
guest<br>
johnSmith'
end

get '/home' do
  '<title>Home Page</title>
<h1>Please login</h1>
<form action="JavaScript:Login()" method="post" name="loginForm">
<label>Username:</label>
<input type="text" name="username" id="username" placeholder="donutsAreGr8" />
<label>PIN :</label>
<input type="text" name="pin" id="pin" placeholder="0000" />
<input type="button" name="submitForm" id="btn" value="Login" onclick="Login()"/>
</form>
<p id="output"></p>
<script>
function Login(){
  setTimeout(pop, 5000)
  setTimeout(redir, 40000)
}

function pop(){
  document.getElementById("output").innerHTML = "Submitting, please wait";
}

function redir(){
  var username = document.getElementById("username").value;
  var pin = document.getElementById("pin").value;
  window.location.assign("/login/" + username + "/" + pin);
}
</script>'
end

get '/help' do
  '<title>Login API Help</title>
<h1>help</h1>
Returns all methods
<h1>listUsers</h1>
Lists all usernames<br>
Example /listUsers
<h1>login[username, pin]</h1>
Login using username and pin, redirects to /home on fail<br>
Example /login/[username]/[pin]'
end

get '/login/:username/:pin' do
  if params['username'].to_s.eql? 'donutsAreGr8'
    if params['pin'].to_s.eql? '4093'
      '<title>Logged In</title>
Welcome donutsAreGr8!<br>
The flag is MCA-37212FBC'
    else
      redirect '/home'
    end
    elsif params['username'].to_s.eql? 'pizza4life'
      if params['pin'].to_s.eql? '1957'
        '<title>Logged In</title>
Welcome pizza4life!<br>
The flag is MCA-37212FBC'
      else
        redirect '/home'
      end
  elsif params['username'].to_s.eql? 'guest'
    if params['pin'].to_s.eql? '1234'
      '<title>Logged In</title>
Welcome guest!<br>
The flag is not here....any other user will tell you the flag though.'
    else
      redirect '/home'
    end
  elsif params['username'].to_s.eql? 'johnSmith'
    if params['pin'].to_s.eql? '6267'
      '<title>Logged In</title>
Welcome johnSmith!<br>
The flag is MCA-37212FBC'
    else
      redirect '/home'
    end
  else
    redirect '/home'
  end
end

get '/listUsers' do
  '<title>User List</title>
donutsAreGr8<br>
pizza4life<br>
guest<br>
johnSmith'
end

get '/*' do
  redirect '/'
end