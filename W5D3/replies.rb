require_relative 'questions_db.rb'
require_relative 'users.rb'
require_relative 'questions.rb'
require_relative 'question_likes.rb'
require_relative 'question_follows.rb'

class Reply

    attr_accessor :parent_reply_id, :body, :question_id, :user_id

    def self.all
        data = QuestionDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_id(id)
        person = QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE id = ?
      SQL
      return nil unless person.length > 0      
      Reply.new(person.first)
    end

    def self.find_by_user_id(user_id)
        user = QuestionDatabase.instance.execute(<<-SQL, user_id)
        SELECT *
        FROM replies
        WHERE user_id = ?
        SQL
    end

    def self.find_by_question_id(question_id)
        user = QuestionDatabase.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM replies
        WHERE question_id = ?
        SQL
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @parent_reply_id = options['reply_id']
        @body = options['body']
    end

    def author
        User.find_by_id(@user_id)
    end

    def question
        Question.find_by_id(@question_id)
    end

    def parent_reply
        Reply.find_by_id(@parent_reply_id)
    end

    def child_replies
        child = QuestionDatabase.instance.execute(<<-SQL, self.id)
            SELECT * 
            FROM replies 
            WHERE parent_reply_id = ?
        SQL
        Reply.new(child.first)
    end
    
end