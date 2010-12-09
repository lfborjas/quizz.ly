require 'mustache'
require 'models'
require 'dm-migrations'
require 'git'

class Generate < Thor
    include Thor::Actions

    desc "database", "Re-creates the database from scratch"
    def database 
        DataMapper.auto_migrate!
        Question.seed
    end

    desc "quizzes --test", "Generate quizzes"
    method_options :test => :boolean
    def quizzes
        invoke :database

        Mustache.template_file = File.dirname(__FILE__) + '/templates/quiz.mustache'
        
        Taker::Takers.each do |student| 
            quiz = Mustache.new
            t = Taker.create :uid => student
            
            quiz[:question] = t.questions.collect{|q| {:content=>q.question} }

            quizzes_dir = options.test? ? "#{Dir.pwd}/test_quizzes" : "#{Dir.pwd}/quizzes"
            quizz_name  = "#{quizzes_dir}/#{t.uid}/examen.html" 
            say "Creating quiz #{quizz_name}"
            repo = Git.init File.join(quizzes_dir, t.uid)
            File.open(quizz_name, 'w').write(quiz.render)
            repo.add quizz_name
            repo.add_remote "origin", "git@lfborjas.xen.prgmr.com:#{t.uid}_examen3.git"
            repo.commit "Quiz generado automáticamente"
            repo.push unless options.test?
        end
    end
end
