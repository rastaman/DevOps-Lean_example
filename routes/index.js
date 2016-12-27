var express = require('express');
var router = express.Router();
var _ = require('lodash');

/* GET home page. */
router.get('/', function(req, res) {
    res.send('Hello! The API is at http://localhost:' + port + '/api');
});

module.exports = router;