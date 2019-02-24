var redisScan = require('redisscan');
var redis = require('redis').createClient();

client.on("error", function (err) {
    console.log("Error " + err);
});

var theDiv = document.getElementById("redisData");
//var content = document.createTextNode("data");

redisScan({
        redis: redis,
        each_callback: function (type, key, subkey, value, cb) {
            theDiv.innerHTML += value;
            cb();
        },
        done_callback: function (err) {
            heDiv.innerHTML += "-=-=-=-=-=--=-=-=-";
            redis.quit();
        }
    });