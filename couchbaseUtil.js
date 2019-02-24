var couchbase = require('couchbase')
var cluster = new couchbase.Cluster('couchbase://127.0.0.1');

cluster.authenticate('username', 'password')
var bucket = cluster.openBucket('default');

module.exports = {
    getData: function(key){
        bucket.get('testkey', function(err,result){
            if(err){
                throw err;
            }
            console.log(result.value)
        })
    }
}