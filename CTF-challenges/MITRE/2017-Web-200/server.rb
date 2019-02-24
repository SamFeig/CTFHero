require 'sinatra'
include FileUtils::Verbose

enable :inline_templates

def randomFileName
  ray = ('a'..'z').to_a + (0..9).to_a
  name = ''
  (0..(10 + Random.rand(10))).each do
    name += ray.sample.to_s
  end
  name
end

get '/' do
  '<title>No Page</title>
<h1>Please access the <a href="/home">Home Page</a></h1>'
end

get '/home' do
  erb :home
end

get '/uploadFile' do
  erb :upload
end

post '/getFile' do
  tempfile = params[:file][:tempfile]
  @filename = params[:file][:filename]
  @randomized = randomFileName
  rm_f("private/uploads/#{@randomized}.html") if File.exists? "private/uploads/#{@randomized}.html"
  cp(tempfile.path, "private/uploads/#{@randomized}.html")
  erb :uploaded
end

post '/getScreenshot' do
  id = params[:id]
  require 'webshot'
  require_relative 'myFinders'
  require_relative 'myActions'
  ws = Webshot::Screenshot.instance

  if File.exists? "private/uploads/#{id.to_s}.html"
    ws.start_session do
      visit "private/uploads/#{id.to_s}.html"
      fill_in 'da flag field', with: 'MCA{8Fo4Mcg1vp}'
      width = 1920
      height = 1080
      path = 'tmp/' + id.to_s + '.png'
      driver.save_screenshot(path, width: width, height: height, full: true, background: 'white')
      thumb = MiniMagick::Image.open(path)
      if block_given?
        yield thumb
      else
        thumb.combine_options do |c|
          c.thumbnail "#{width}x"
          c.background 'white'
          c.extent "#{width}x#{height}"
          c.gravity 'north'
          c.quality 85
        end
      end
      thumb.write path
      thumb
    end
    send_file 'tmp/' +  id.to_s + '.png'
  else
    erb :failed
  end
end

get '/requestScreenshot' do
  erb :screenshot
end

get '/*' do
  redirect '/'
end

__END__

@@ home
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Screenshot.com</title>
</head>
<body>
<h1>Welcome to Screenshot.com</h1>
Here you can <a href="uploadFile">upload</a> an html file and see a <a href="requestScreenshot">screenshot</a> of it.
</body>
</html>

@@ upload
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Webpage</title>
</head>
<body>
Upload your HTML file here.
You will receive a unique code you can use to have a screenshot taken of your webpage by clicking <a href="home">here</a>.
<form action="getFile" method="post" enctype="multipart/form-data">
    <input type="file" id="file" name="file" required>
    <input type="submit" value="Upload">
</form>
</body>
</html>

@@ uploaded
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Uploaded</title>
</head>
<body>
<%= @filename %> has been uploaded.
Your unique code for retrieving screenshots is: <%= @randomized %>.
</body>
</html>

@@ screenshot
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Code</title>
</head>
<body>
<form action="getScreenshot" method="post">
    <label for="id">Input unique code:</label>
    <input id="id" name="id" size="30" required>
    <input type="submit" value="Generate Screenshot">
</form>
</body>
</html>

@@ failed
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Incorrect</title>
</head>
<body>
The unique code you entered was not found.
Click <a href="requestScreenshot">here</a> to try again.
</body>
</html>