require_relative 'questions_db.rb'
require_relative 'users.rb'
require_relative 'question_follows.rb'

class Question

    attr_accessor :title, :body, :user_id

    def self.all
        data = QuestionDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(id)
        person = QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM questions
        WHERE id = ?
      SQL
      return nil unless person.length > 0      
      Question.new(person.first)
    end

    def self.find_by_author(author_id)
      author = QuestionDatabase.instance.execute(<<-SQL, author_id)
        SELECT *
        FROM questions
        WHERE user_id = ?
      SQL
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def author
      User.find_by_id(@user_id)
    end

    def replies
      Reply.find_by_question_id(@id)
    end

    def followers
      QuestionFollow.followers_for_question_id(@id)
    end
end