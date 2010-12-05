//to export stuff, you can either use `this` or set it in `exports`
//cf. http://nodejs.org/docs/v0.2.5/api.html#modules-312


var cradle = require('cradle');
var con    = new cradle.Connection();
require("underscore");
//get or create the database:
var db;

this.setup = function(options){
    db = con.database(options.database_name || "question_bank");
    db.exists(function(nil, db_exists){
        if(!db_exists){
            db.create();
            db.save("_design/questions",{
                random: {
                            map: function(doc){
                                  emit(Math.random(), doc);  
                                 }
                        }
            });
        }
    });
};

/*To store quizz questions*/
//properties is an object with the question properties
this.Question = new function(){
    this.create = function(properties){
        db.save(properties, function(err, res){
            //don't do much...     
        });
    };

    this.assignRandom = function(n){
        //based in this: 
    };
};

this.Quizz = function(number_of_questions){
    this.participants = {};
    this.newParticipant = function(address){
        //create new participant by selecting n random questions for him
        //and appending to the participants object
        //return the new object
    };
}
