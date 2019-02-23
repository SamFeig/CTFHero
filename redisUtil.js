var redis = require('redis');
var client = redis.createClient();
var fs = require('fs')
// var client = redis.createClient(port, host); // if we need to use a custom host and port


client.on('connect', function() {
    console.log('Redis client connected');
});

client.on('error', function (err) {
    console.log('Something went wrong ' + err);
});


module.exports = {
    setData: function(key,data,response){
        client.set(key,data,redis.print);
        console.log("inserted data " + data + " at key " + key)
        response.send("data successfully inserted")
    },
    
    getData: function(key,response){
        client.get(key, function (error, result) {
            if (error) {
                console.log(error);
                throw error;
            }
            console.log('Query result ' + result);
            // do something with the resulting data
            var file = fs.readFileSync(result,'binary') // __dirname + '/upload-folder/dramaticpenguin.MOV', 'binary');

            response.setHeader('Content-Length', file.length);
            response.write(file, 'binary');
            response.end();
        });
    }
}
