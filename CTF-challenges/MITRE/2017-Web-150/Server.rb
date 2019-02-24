require 'sinatra'

enable :inline_templates

flag = 'MCA{LIzdfHTUNUuZBhFKW20CChxJbRSNZbvv0SGnyEXkcrn9bPEz}' #53 long
empty ='-----------------------------------------------------'

get '/' do
  '<title>No Page</title>
<h1>Please access the home page</h1>
<a href="/home">Home Page</a>'
end

get '/home' do
  @qid = Random.rand(1000)
  erb :home
end

get '/captcha/validate' do
  @qid = Integer(params[:qid])
  if(params[:cb0].nil?)
    @cb = '0'
  else
    @cb = '1'
  end
  if(params[:cb1].nil?)
    @cb += '0'
  else
    @cb += '1'
  end
  if(params[:cb2].nil?)
    @cb += '0'
  else
    @cb += '1'
  end
  if(params[:cb3].nil?)
    @cb += '0'
  else
    @cb += '1'
  end
  if(params[:cb4].nil?)
    @cb += '0'
  else
    @cb += '1'
  end
  if(params[:cb5].nil?)
    @cb += '0'
  else
    @cb += '1'
  end
  @answ = @cb
  @resp = 'Incorrect'
  expt = ''
  temp = (@qid.to_i + 7) * 13
  for i in 0..5
    expt += (temp % 2).to_s
    temp = temp / 2
  end
  if expt.eql?(@answ)
    point = @qid.to_i % 53
    if point.equal?0
      @resp = flag[point, 1] + empty[point + 1..53]
    else
      @resp = empty[0..point - 1] + flag[point, 1] + empty[point + 1..53]
    end
  end
  erb :validate
end

get '/*' do
  redirect '/'
end

__END__

@@ home
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <title>CAPTTTTCHA</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#captcha').submit(function (ev) {
                //this happens if form is submitted
                //prevent the default behavior of a form (it should do nothing in our case)
                ev.preventDefault();
                //send an ajax request to our action

                $.ajax({
                    url: "/captcha/validate",
                    //serialize the form and use it as data for ajax request
                    data: $(this).serialize(),
                    dataType: "html",
                    success: function (data) {
                        //if our ajax request is successful, replace the content of our output div with the response data
                        $('#output').html(data);
                    }
                });
            });

        });
    </script>
    <script type="text/javascript">
        function load() {
            //Gets all areas in the map
            var all_checkbox_divs = document.getElementsByTagName("AREA");

            for (var i = 0; i < all_checkbox_divs.length; i++) {

                //adds onclick functions to all areas
                all_checkbox_divs[i].onclick = function (e) {

                    var div_id = this.id;
                    var checkbox_id = div_id.split("_")[0];
                    var checkbox_element = document.getElementById(checkbox_id);

                    var pic = document.getElementById(checkbox_id + '_pic');

                    if (pic.src.toString().indexOf('images/cap0.png') !== -1) {
                        pic.src = "images/cap1.png";
                    }
                    else {
                        pic.src = "images/cap0.png";
                    }

                    //toggles hidden checkboxes when areas are clicked
                    if (checkbox_element.checked === true) {
                        checkbox_element.checked = false;
                        this.setAttribute("class", "image-checkbox");
                    } else {
                        checkbox_element.checked = true;
                        this.setAttribute("class", "image-checkbox-checked");
                    }

                };
            }
            RandomWord();

        }
    </script>
    <script>
        function RandomWord() {
            //query random word generator to get random word
            var requestStr = "http://setgetgo.com/randomword/get.php";

            $.ajax({
                type: "GET",
                url: requestStr,
                dataType: "html",
                success: function (data) {
                    //if our ajax request is successful, replace the content of our noun div with the response data
                    $('#noun').html(data);
                }
            });
        }
    </script>
    <style>
        input.cb {
            visibility: hidden;
        }
    </style>
</head>
<body onload="load()">
<h4>Please complete the CAPTCHA below to receive your <b>FREE</b> flag.</h4>
<form action="/" method="post" id="captcha">
    <input name="qid" type="number" hidden value="<%= @qid %>">
    <input name="cb0" type="checkbox" id="cb0" class="cb"/>
    <br/>
    <img src="images/cap0.png" height="200" width="201" usemap="#capPic0" id="cb0_pic"/>
    <img src="images/cap0.png" height="200" width="201" usemap="#capPic1" id="cb1_pic"/><br/>
    <img src="images/cap0.png" height="200" width="201" usemap="#capPic2" id="cb2_pic"/>
    <img src="images/cap0.png" height="200" width="201" usemap="#capPic3" id="cb3_pic"/><br/>
    <img src="images/cap0.png" height="200" width="201" usemap="#capPic4" id="cb4_pic"/>
    <img src="images/cap0.png" height="200" width="201" usemap="#capPic5" id="cb5_pic"/>
    <map name="capPic0">
        <area id="cb0_proxy" coords="0,0,200,200"/>
    </map>
    <map name="capPic1">
        <area id="cb1_proxy" coords="0,0,200,200"/>
    </map>
    <map name="capPic2">
        <area id="cb2_proxy" coords="0,0,200,200"/>
    </map>
    <map name="capPic3">
        <area id="cb3_proxy" coords="0,0,200,200"/>
    </map>
    <map name="capPic4">
        <area id="cb4_proxy" coords="0,0,200,200"/>
    </map>
    <map name="capPic5">
        <area id="cb5_proxy" coords="0,0,200,200"/>
    </map>
    <input name="cb1" type="checkbox" class="cb" id="cb1"/>
    <input name="cb2" type="checkbox" class="cb" id="cb2"/>
    <input name="cb3" type="checkbox" class="cb" id="cb3"/>
    <input name="cb4" type="checkbox" class="cb" id="cb4"/>
    <input name="cb5" type="checkbox" class="cb" id="cb5"/>
    <br/>
    Click all the images of <b id="noun"></b>.
    <br/><br/>
    <input type="submit" value="Verify">
</form>
<div id="output">
</div>
</body>
</html>



@@ validate
<h1>Here is your flag: <%= @resp %></h1>