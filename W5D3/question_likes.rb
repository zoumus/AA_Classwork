require_relative 'questions_db.rb'

class QuestionLike

    attr_accessor :liked, :question_id, :user_id

    def self.all
        data = QuestionDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |datum| QuestionLike.new(datum) }
    end

    def self.find_by_id(id)
        person = QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM question_likes
        WHERE id = ?
      SQL
      return nil unless person.length > 0      
      QuestionLike.new(person.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @liked = options['liked']
    end
    
end