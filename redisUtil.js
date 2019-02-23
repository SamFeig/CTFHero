var redis = require('redis');
var client = redis.createClient(); 

// var client = redis.createClient(port, host); // if we need to use a custom host and port


client.on('connect', function() {
    console.log('Redis client connected');
});

client.on('error', function (err) {
    console.log('Something went wrong ' + err);
});

function setData(key,data){
    client.set(key,data,redis.print);
}

function getData(key){
    client.get(key, function (error, result) {
        if (error) {
            console.log(error);
            throw error;
        }
        console.log('Query result' + result);
        // do something with the resulting data
    });
}


