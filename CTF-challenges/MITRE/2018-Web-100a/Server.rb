require 'sinatra'
require 'pg'

enable :inline_templates

get '/' do
  adChoice = rand(10); 
   if adChoice == 7
  AdImageCode = '<img src="/Resources/ad4.png" alt="Call 555-523-3311 for FREE samples of our latest product" height="200" width="200">'
end
  if adChoice <= 6 
  AdImageCode = '<img src="/Resources/ad1.gif" alt="Call 555-523-3311 for FREE samples of our latest product" height="200" width="200">'
end
if adChoice == 8
  AdImageCode = "<img src='/Resources/ad2.png' alt='Call 555-523-3311 for FREE samples of our latest product' height='200' width='200'> 
  <iframe src='/Resources/sale.html'  scrolling='no' style=' width: 0px; height: 0px;  overflow: hidden;' >
  <p>Your browser does not support iframes.</p>
   </iframe>"
end
if adChoice == 9
  AdImageCode = '<img src="/Resources/ad3.png" alt="Call 555-523-3311 for FREE samples of our latest product" height="200" width="200">'
end

  "<title>Amazing Website</title>
  <body style='background-color:PowderBlue;'>
<center>
<h1><b> <p style='font-family:verdana;color:red'>Dank Website</p></b></h1>
</center>

<audio id='myAudio'>
  <source src='/Resources/congratulations.wav' type='audio/mpeg'>
</audio>
<script>
var x = document.getElementById('myAudio');
x.loop = true;
x.load();
x.play(); 
</script>

<script>
alert('YOU HAVE WON!!!! CALL 555-0131 TO CLAIM YOUR PRIZE!!!')
</script>

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nunc ligula, lobortis in fermentum non, efficitur at sapien. Phasellus ut posuere ligula, ac dapibus tellus. Cras sodales, nulla convallis faucibus aliquam, enim purus maximus mauris, mollis fermentum urna ante non nisi. Donec ipsum ipsum, molestie quis velit et, porta blandit arcu. Maecenas varius sit amet dui quis ullamcorper. Maecenas risus turpis, faucibus sed est ac, cursus tempor leo. Suspendisse et tristique sem, ut faucibus justo. Phasellus vel ultricies turpis, ut aliquet leo.
<br>
<br>
Nam elit diam, vestibulum vitae tellus a, vestibulum vestibulum nisi. Phasellus purus elit, hendrerit et hendrerit sit amet, bibendum id erat. Donec facilisis lacinia nulla, sed hendrerit magna ullamcorper a. Donec accumsan lacus non elit rhoncus feugiat. Fusce quis velit pharetra, consequat risus ac, rutrum urna. Cras aliquam sit amet nisl sodales ullamcorper. Aenean condimentum, ante eget rutrum lacinia, tellus libero fringilla augue, eu ultrices ipsum lorem id nisl. Donec laoreet lectus ut mollis vestibulum. Proin vestibulum massa sed velit egestas scelerisque. Aenean commodo mauris est, ac posuere justo imperdiet a.
<br>
<br>
Ut scelerisque quam eu augue vestibulum elementum. Mauris eu nulla neque. Donec fringilla tristique molestie. Donec vulputate neque at dui dictum condimentum vitae et neque. Curabitur commodo sollicitudin nulla eu pellentesque. Duis sed odio sit amet augue cursus aliquam vitae in justo. Aliquam euismod, justo imperdiet luctus tempor, neque massa pharetra purus, eget maximus nisi velit nec tellus. Aliquam non mollis nunc. Cras eros est, aliquam et pellentesque non, faucibus in urna.
<br>
<br>
Quisque eu venenatis eros. Phasellus dictum, ante et sagittis feugiat, enim orci lobortis velit, quis rutrum est est at ipsum. Sed nec odio eu risus eleifend auctor. Etiam malesuada, risus et aliquam suscipit, felis ante mattis velit, at sagittis eros est blandit purus. Pellentesque sit amet quam et ipsum volutpat gravida sit amet eu turpis. Suspendisse diam odio, suscipit vel ultricies eu, auctor ac sapien. Donec nec lacus arcu. In interdum urna in tellus rutrum, eu imperdiet ante dignissim. Ut dui erat, pellentesque eu neque nec, placerat vestibulum est. Pellentesque convallis eros nunc, nec sodales mauris semper nec. Pellentesque consectetur augue id mi feugiat condimentum.
<br>
<br>
Nullam vitae ultrices nunc. Aenean urna nibh, commodo at gravida vel, blandit vitae mi. Sed orci tortor, mattis et magna quis, imperdiet elementum enim. Ut tempus consequat nisi quis malesuada. Donec erat libero, mollis ac ante quis, scelerisque iaculis erat. Maecenas ut sapien imperdiet, convallis eros eget, iaculis purus. Cras ultrices rutrum nisl non convallis. Mauris ornare, lacus nec dictum interdum, tortor nisl placerat ex, vel finibus nibh enim et velit. Nulla viverra felis quis tellus hendrerit tempus. Aliquam consequat mattis sem eu pellentesque. Integer iaculis, libero scelerisque consectetur vehicula, metus turpis bibendum enim, at dictum massa lectus ut ligula. Pellentesque quis nisi placerat, pellentesque nibh a, porta tellus. Etiam eu magna efficitur justo vestibulum finibus. Vestibulum eget erat augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
<br>
<br>
<center>
#{AdImageCode}
</center>
"
end



