require_relative 'questions_db.rb'
require_relative 'questions.rb'
require_relative 'question_follows.rb'
require_relative 'replies.rb'

class User

    attr_accessor :fname, :lname

    def self.all
        data = QuestionDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_id(id)
        person = QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM users
        WHERE id = ?
      SQL
      return nil unless person.length > 0      
      User.new(person.first)
    end
    
    def self.find_by_name(fname, lname)
        person = QuestionDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT *
        FROM users
        WHERE fname = ?
        AND lname = ?
      SQL
      return nil unless person.length > 0      
      User.new(person.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        Question.find_by_author(@id)
    end

    def authored_replies
        Reply.find_by_user_id(@id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(@id)
    end
    

end