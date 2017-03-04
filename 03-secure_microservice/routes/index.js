var express = require('express');
var router = express.Router();
var elastic = require('../elasticsearch');
var _ = require('lodash');

/* GET home page. */
router.get('/names', function(req, res) {
  
  url = 'http://localhost:3001/roleCheck';

  request(url, function(error, response, html){
    if(!error){
      var $ = cheerio.load(html)

      var json = {"firstName":"John", "lastName":"Phan"};
      console.log(json);
      res.send(JSON.stringify(json))

    }
  })

});

module.exports = router;