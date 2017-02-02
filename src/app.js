'use strict';

const app = require('express')();
var bodyParser = require('body-parser');

const getRoutes = require('./routes/get.js');
const postRoutes = require('./routes/post.js');

var port = process.argv[2] || process.env.port || 9100;

// CORS Headers
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use('/', getRoutes);
app.use('/', postRoutes);

app.listen(port, () => {
  console.log('App listening on port ' + port);
});