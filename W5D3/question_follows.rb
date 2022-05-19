require_relative 'questions_db.rb'
require_relative 'users.rb'
require_relative 'questions.rb'
require_relative 'question_likes.rb'
require_relative 'replies.rb'

class QuestionFollow

    attr_accessor :user_id, :question_id

    def self.all
        data = QuestionDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| QuestionFollow.new(datum) }
    end

    def self.find_by_id(id)
        person = QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM question_follows
        WHERE id = ?
      SQL
      return nil unless person.length > 0      
      QuestionFollow.new(person.first)
    end

    def self.followers_for_question_id(id)
        quest = QuestionDatabase.instance.execute(<<-SQL, id)
            SELECT user_id
            FROM question_follows
            WHERE question_id = ?
        SQL
        quest.map { |user| User.find_by_id(user['user_id']) }
    end

    def self.followed_questions_for_user_id(id)
        quest = QuestionDatabase.instance.execute(<<-SQL, id)
           SELECT question_id
           FROM question_follows
           WHERE user_id = ?
        SQL
        quest.map { |question| Question.find_by_id(question['question_id']) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
    
end