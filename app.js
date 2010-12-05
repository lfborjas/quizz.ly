var express = require('express');
var connect = require('connect');
var app = express.createServer();

app.configure(function(){
    //app.use(express.methodOverride()); //to use PUT & DELETE from a browser
    app.use(express.bodyDecoder()); //to decode POST bodies into readable objects
    app.use(express.staticProvider(__dirname + '/public')); //set the static assets route
});

app.get("/", function(req, res){
    res.render("index.ejs");
});

app.listen(3000);
