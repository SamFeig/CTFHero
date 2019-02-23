const express = require('express')
const path = require('path')
const exphbs = require('express-handlebars')
const redis = require('./redisUtil')

const app = express()
const port = 3000

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

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
  console.log("HERE")
    response.render('home', {
      name: 'John'
    })
  })

app.post('/getFile', (request,response) => {
  redis.getData(request.body.key,response)
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
/*
app.get('/', (request, response) => {
    response.send('Hello from Express!')
    throw new Error('oops')
  })

  app.use((err, request, response, next) => {
    // log the error, for now just console.log
    console.log(err)
    response.status(500).send('Something broke!')
  })

app.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`)
})*/