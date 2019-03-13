const express = require('express')
const path = require('path')
const exphbs = require('express-handlebars')
const redis = require('./redisUtil')
const https = require('https')
const http = require('http')
const fs = require('fs')

const app = express()
// const port = 80


const privateKey = fs.readFileSync('/etc/letsencrypt/live/ctfhero.com/privkey.pem', 'utf8');
const certificate = fs.readFileSync('/etc/letsencrypt/live/ctfhero.com/cert.pem', 'utf8');
const ca = fs.readFileSync('/etc/letsencrypt/live/ctfhero.com/chain.pem', 'utf8');

const credentials = {
	key: privateKey,
	cert: certificate,
	ca: ca
};


const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

app.use(express.static(__dirname + "/public/_site"));


app.post("/", function (req, res) {
    console.log(req.body.user.name)
});

app.engine('.hbs', exphbs({
  defaultLayout: 'main',
  extname: '.hbs',
  layoutsDir: path.join(__dirname, 'views/layouts')
}))
app.set('view engine', '.hbs')
app.set('views', path.join(__dirname, 'views'))

app.get('/', (request, response) => {
  response.sendFile(__dirname + "/public/_site/index.html")
})

app.get('/compete', (request, response) => {
  response.sendFile(__dirname + "/public/_site/compete/compete.html")
})

app.get('/archive', (request, response) => {
  response.sendFile(__dirname + "/public/_site/archive/archive.html")
})

app.get('/about', (request,response) => {
  response.sendFile(__dirname + '/public/_site/about.html')
})

app.get('/practice', (request, response) => {
  response.sendFile(__dirname + "/public/_site/practice/practice.html")
})
app.get('/practice/2015-crypto-300A', (request, response) => {
  response.sendFile(__dirname + "/public/_site/practice/2015-crypto-300A.html")
})
app.get('/practice/2016-Forensics-150', (request, response) => {
  response.sendFile(__dirname + "/public/_site/practice/2016-Forensics-150.html")
})
app.get('/practice/2016-Grab-Bag-150', (request, response) => {
  response.sendFile(__dirname + "/public/_site/practice/2016-Grab-Bag-150.html")
})
app.get('/practice/2018-crypto-flipping-bits', (request, response) => {
  response.sendFile(__dirname + "/public/_site/practice/2018-crypto-flipping-bits.html")
})

app.post('/getZipFile', (request,response) => {
  redis.getZipFile(request.body.key,response)
})

app.post('/getWebChallenge', (request,response) => {
  redis.getWebChallenge(request.body.key,response)
})

app.post('/insertpath', (request,response) => {
  redis.setData(request.body.key,request.body.data,response)
})

/*
app.get('/.well-known/acme-challenge/XwS9iUi_d_1KuzAzrJs5pWUSrVVKShM-Ow8UFtdeLms',(req,res) => {
	res.send('XwS9iUi_d_1KuzAzrJs5pWUSrVVKShM-Ow8UFtdeLms.E_pzGqz4p2-3wQqolcItwArcR-57p9PCLZAFeLPHAxo')
})

app.get('/.well-known/acme-challenge/XsJYBwgFBn4r64SZsRWk2y2UFxh5QjyGNJG7FaW8wTY',(req,res) => {
	res.send('XsJYBwgFBn4r64SZsRWk2y2UFxh5QjyGNJG7FaW8wTY.E_pzGqz4p2-3wQqolcItwArcR-57p9PCLZAFeLPHAxo')
})
*/
//const httpServer = http.createServer(app);
const httpServer = http.createServer(function(request,response) {
	  response.writeHead(301, { "Location": "https://" + request.headers['host'] + request.url });
	  response.end();
});
const httpsServer = https.createServer(credentials, app);

httpServer.listen(80, () => {
  console.log('HTTP Server running on port 80');
});


httpsServer.listen(443, () => {
	console.log('HTTPS Server running on port 443');
});


/*
app.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`)
})
*/
