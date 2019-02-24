require 'sinatra'
require 'pg'

require_relative 'makeDB'

enable :inline_templates

begin
sleep 5

setup

sleep 2
rescue PGError
  print 'db already created'
end

camSerial = 2296354227

con = PG::Connection.connect_start(:dbname => 'db',
                                   :user => 'default_user',
                                   :host => 'db',
                                   :password => 'default_user')

socket = con.socket_io
status = con.connect_poll
while status != PG::PGRES_POLLING_OK do
  # do some work while waiting for the connection to complete
  if status == PG::PGRES_POLLING_READING
    if (not select([socket], [], [], 10.0))
      raise "Asynchronous connection timed out!"
    end
  elsif(status == PG::PGRES_POLLING_WRITING)
    if(not select([], [socket], [], 10.0))
      raise "Asynchronous connection timed out!"
    end
  end
  status = con.connect_poll
end

get '/' do
  '<title>No Page</title>
<h1>Please access the <a href="/home">Home Page</a></h1>'
end

get '/home' do
  erb :home
end

post '/login' do
  @resp = params[:uname].to_s
  erb :incorrect
end

get '/register' do
  erb :register
end

post '/register' do
  if params[:serial].to_i == camSerial
    @username = params[:usr]
    erb :login
  else
    begin
      res = con.exec 'SELECT COUNT(username) FROM cameras where username=\'' + params[:usr].to_s + '\''
    rescue PGError
      con = PG::Connection.connect_start(:dbname => 'db',
                                         :user => 'default_user',
                                         :host => 'db',
                                         :password => 'default_user')

      socket = con.socket_io
      status = con.connect_poll
      while status != PG::PGRES_POLLING_OK do
        # do some work while waiting for the connection to complete
        if status == PG::PGRES_POLLING_READING
          if (not select([socket], [], [], 10.0))
            raise "Asynchronous connection timed out!"
          end
        elsif(status == PG::PGRES_POLLING_WRITING)
          if(not select([], [socket], [], 10.0))
            raise "Asynchronous connection timed out!"
          end
        end
        status = con.connect_poll
      end
      res = con.exec 'SELECT COUNT(username) FROM cameras where username=\'' + params[:usr].to_s + '\''
    end
    @resp = res.values.to_s
    erb :wrongReg
  end
end

get '/*' do
  redirect'/'
end

__END__

@@ home
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
<h1>Meretricious Security Cams</h1>
Please login or register to access your camera remotely.
<br><br><br>
<form id="login" method="post" action="/login">
    <label for="uname">Username:</label><br>
    <input type="text" id="uname" name="uname"><br>
    <label for="pwd">Password:</label><br>
    <input type="password" id="pwd" name="pwd"><br>
    <button type="submit">Login</button>
</form>
<br><br>
Click <a href="/register">here</a> to register.
</body>
</html>

@@ login
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
Welcome <%= @username %>!
<br>
Your security camera feed can be found below
<br>
<br>
<br>
<video autoplay loop poster="https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif" height="600" width="700">
    <source src="videos/IMG_0116.webm" type="video/webm">
    <source src="videos/IMG_0116.mp4" type="video/mp4">
</video>
</body>
</html>

@@ incorrect
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Incorrect</title>
</head>
<body>
<h1>Meretricious Security Cams</h1>
Please login or register to access your camera remotely.
<br><br><br>
<form id="login" method="post" action="/login">
    <label for="uname">Username:</label><br>
    <input type="text" id="uname" name="uname"><br>
    <label for="pwd">Password:</label><br>
    <input type="password" id="pwd" name="pwd"><br>
    <button type="submit">Login</button>
</form>
<h3><p style="color: red">Username <%= @resp %> was not found.  Please try again.</p></h3>
<br><br>
Click <a href="/register">here</a> to register.
</body>
</html>

@@ register
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
Please fill out the form below to create your account.
<br><br>
<form name="register" id="register" onsubmit="return validate()" action="/register" method="post">
    <label for="usr">Username:</label><br>
    <input name="usr" id="usr" type="text" required><br>
    <label for="serial">Camera Serial Number:</label><br>
    <input name="serial" id="serial" type="number" min="1000000000" required><br>
    <label for="pwd">Password:</label><br>
    <input name="pwd" id="pwd" type="password" required><br>
    <label for="conf-pwd">Confirm Password:</label><br>
    <input name="conf-pwd" id="conf-pwd" type="password" required><br>
    <button type="submit">Register</button>
</form>
</body>
<script type="text/javascript">
    function validate() {
        if(passwordsMatch())
            if(passwordLength())
                return true;
        return false;
    }

    function passwordsMatch() {
        if(document.getElementById("pwd").value === document.getElementById("conf-pwd").value)
            return true;
        alert("Passwords do not match");
        return false;
    }

    function passwordLength() {
        if(document.getElementById("pwd").value.length >= 6)
            return true;
        alert("Password should be at least 6 characters");
        return false;
    }
</script>
</html>

@@ wrongReg
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
Please fill out the form below to create your account.
<br><br>
<form name="register" id="register" onsubmit="return validate()" action="/register" method="post">
    <label for="usr">Username:</label><br>
    <input name="usr" id="usr" type="text" required><br>
    <label for="serial">Camera Serial Number:</label><br>
    <input name="serial" id="serial" type="number" min="1000000000" required><br>
    <label for="pwd">Password:</label><br>
    <input name="pwd" id="pwd" type="password" required><br>
    <label for="conf-pwd">Confirm Password:</label><br>
    <input name="conf-pwd" id="conf-pwd" type="password" required><br>
    <button type="submit">Register</button>
</form>
<h3><p style="color: red">Already <%= @resp %> users with that username.  Please pick a new one.</p></h3>
</body>
<script type="text/javascript">
    function validate() {
        if(passwordsMatch())
            if(passwordLength())
                return true;
        return false;
    }

    function passwordsMatch() {
        if(document.getElementById("pwd").value === document.getElementById("conf-pwd").value)
            return true;
        alert("Passwords do not match");
        return false;
    }

    function passwordLength() {
        if(document.getElementById("pwd").value.length >= 6)
            return true;
        alert("Password should be at least 6 characters");
        return false;
    }
</script>
</html>