require 'sinatra'

get '/' do
  '<title>API Key Request</title>
<h1>API Key Request</h1>
<a href="/api/key-request/mobile">Request new key</a>'
end

get '/home' do
  '<title>API Key Request</title>
<h1>API Key Request Home Screen</h1>'
end

get '/api/key-request/mobile' do
  num = Random.rand(1000..9999)
  '<title>API Key Request</title>
<h1>API Key Request</h1>
Your key is: MAPI' + num.to_s + '<br>
This key is usable for all APIs
<!-- desktop API access is coming soon. -->'
end

get '/api/key-request/desktop' do
  num = Random.rand(1000..9999)
  '<title>API Key Request</title>
<h1>API Key Request</h1>
Your key is: DAPI' + num.to_s + '<br>
This key is usable for all APIs'
end

get '/help' do
  '<title>API Methods</title>
<h1>API Methods</h1>
<h2>getNames[key]</h2>
Returns list of picture names<br>
Example /getNames/[your key here]
<h2>getPicture[key, filename]</h2>
Returns picture with name filename<br>
Example /getPicture/[your key here]/[filename]
<h2>getUploader[key, filename]</h2>
Returns name of user who uploaded picture with name filename<br>
Example /getUploader/[your key here]/[filename]
<h2>help</h2>
Returns all methods'
end

get '/getNames/:key' do
  if params['key'].to_s.size == 8
    if params['key'].to_s[0..3].eql? 'MAPI'
      '<title>Names</title>
ErrorInvalidCredentials.png<br>
Picture1.jpg<br>
Picture2.jpg'
    elsif params['key'].to_s[0..3].eql? 'DAPI'
      '<title>Names</title>
ErrorInvalidCredentials.png<br>
Flag.png<br>
Hello.png<br>
Picture1.jpg<br>
Picture2.jpg'
    else
      '<title>Error</title>
Error invalid key<br>
Check help for more information'
    end
  else
    '<title>Error</title>
Error invalid key<br>
Check help for more information'
  end
end

get '/getNames' do
  '<title>Error</title>
Error in method call<br>
Check help for more information'
end

get '/getPicture/:key/:filename' do
  if params['key'].to_s.size == 8
    if params['key'].to_s[0..3].eql? 'MAPI'
      if params['filename'].to_s.eql? 'Picture1.jpg'
        send_file 'Picture1.jpg'
      elsif params['filename'].to_s.eql? 'Picture2.jpg'
        send_file 'Picture2.jpg'
      elsif params['filename'].to_s.eql? 'ErrorInvalidCredentials.png'
        send_file 'ErrorInvalidCredentials.png'
      else
        '<title>Error</title>
Error invalid filename<br>
Check help for more information'
      end
    elsif params['key'].to_s[0..3].eql? 'DAPI'
      if params['filename'].to_s.eql? 'Picture1.jpg'
        send_file 'Picture1.jpg'
      elsif params['filename'].to_s.eql? 'Picture2.jpg'
        send_file 'Picture2.jpg'
      elsif params['filename'].to_s.eql? 'ErrorInvalidCredentials.png'
        send_file 'ErrorInvalidCredentials.png'
      elsif params['filename'].to_s.eql? 'Flag.png'
        '<title>Flag.png</title>
<!--MCA-618584AA-->
Error displaying image'
      elsif params['filename'].to_s.eql? 'Hello.png'
        send_file 'Hello.png'
      else
        '<title>Error</title>
Error invalid filename<br>
Check help for more information'
      end
    else
      '<title>Error</title>
Error invalid key<br>
Check help for more information'
    end
  else
    '<title>Error</title>
Error invalid key<br>
Check help for more information'
  end
end

get '/getPicture/:key' do
  '<title>Error</title>
Error in method call<br>
Check help for more information'
end

get '/getPicture/' do
  '<title>Error</title>
Error in method call<br>
Check help for more information'
end

get '/getPicture' do
  '<title>Error</title>
Error in method call<br>
Check help for more information'
end

get '/getUploader/:key/:filename' do
  if params['key'].to_s.size == 8
    if params['key'].to_s[0..3].eql? 'MAPI'
      if params['filename'].to_s.eql? 'Picture1.jpg'
        '<title>Picture1.jpg</title>
DrMath uploaded Picture1.jpg'
      elsif params['filename'].to_s.eql? 'Picture2.jpg'
        '<title>Picture2.jpg</title>
SpaceMan uploaded Picture2.jpg'
      elsif params['filename'].to_s.eql? 'ErrorInvalidCredentials.png'
        '<title>ErrorInvalidCredentials.png</title>
root uploaded ErrorInvalidCredentials.png'
      else
        '<title>Error</title>
Error invalid filename<br>
Check help for more information'
      end
    elsif params['key'].to_s[0..3].eql? 'DAPI'
      if params['filename'].to_s.eql? 'Picture1.jpg'
        '<title>Picture1.jpg</title>
DrMath uploaded Picture1.jpg'
      elsif params['filename'].to_s.eql? 'Picture2.jpg'
        '<title>Picture2.jpg</title>
SpaceMan uploaded Picture2.jpg'
      elsif params['filename'].to_s.eql? 'ErrorInvalidCredentials.png'
        '<title>ErrorInvalidCredentials.png</title>
root uploaded ErrorInvalidCredentials.png'
      elsif params['filename'].to_s.eql? 'Flag.png'
        '<title>Flag.png</title>
MCA uploaded Flag.png'
      elsif params['filename'].to_s.eql? 'Hello.png'
        '<title>Hello.png</title>
H4X0R uploaded Hello.png'
      else
        '<title>Error</title>
Error invalid filename<br>
Check help for more information'
      end
    else
      '<title>Error</title>
Error invalid key<br>
Check help for more information'
    end
  else
    '<title>Error</title>
Error invalid key<br>
Check help for more information'
  end
end

get '/getUploader/:key' do
  '<title>Error</title>
Error in method call<br>
Check help for more information'
end

get '/getUploader/' do
  '<title>Error</title>
Error in method call<br>
Check help for more information'
end

get '/getUploader' do
  '<title>Error</title>
Error in method call<br>
Check help for more information'
end

get '/*' do
  call env.merge 'PATH_INFO' => '/'
end