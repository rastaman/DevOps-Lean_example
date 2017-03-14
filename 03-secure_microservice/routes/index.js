var express = require('express');
var router = express.Router();
var _ = require('lodash');
var request = require('request');

router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* GET home page. */
router.post('/names', function(req, res) {
  url = 'http://localhost:3001/api/roleCheck';
  body = { "token": req.body.token, "role": "03-secure_microservice" };
  request(url, body, function(error, response, html){
    if(!error){
      if (response.status) {
        var json = {"firstName":"John", "lastName":"Phan"};
        console.log(json);
        res.send(JSON.stringify(json))
      } else {
        res.json({ status: false, message: 'they lied, the security guys said they are not allowed this data' });
      }
    } else {
      res.json({ status: false, message: 'broken, I am broken help me' + error });
    }
  })

});

module.exports = router;