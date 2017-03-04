var express = require('express');
var router = express.Router();
var _ = require('lodash');
var request = require('request');

router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* GET home page. */
router.get('/names', function(req, res) {
  
  url = 'http://localhost:3001/roleCheck';
  body = { "role": "03-secure_microservice" };
  request(url, body, function(error, response, html){
    if(!error){

      var json = {"firstName":"John", "lastName":"Phan"};
      console.log(json);
      res.send(JSON.stringify(json))

    }
  })

});

module.exports = router;