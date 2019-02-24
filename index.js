const express = require('express')
const path = require('path')
const exphbs = require('express-handlebars')
const redis = require('./redisUtil')

const app = express()
const port = 80

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

app.get('/practice', (request, response) => {
  response.sendFile(__dirname + "/public/_site/practice/practice.html")
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

app.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`)
})
