require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
  class << self
    def find_by_id(id)
      user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM users
        WHERE id = ?
      SQL
      return nil if user.empty?

      Users.new(user.first)
    end

    def find_by_name(fname, lname)
      users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT *
        FROM users
        WHERE fname = ? AND lname = ?
      SQL
      return nil if users.empty?

      users.map! { |user| Users.new(user) }
    end
  end

  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions(author_id)
    Questions.find_by_author_id(author_id)
  end

  def authored_replies(user_id)
    Replies.find_by_user_id(user_id)
  end
end

class Questions
  class << self
    def find_by_id(id)
      question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM questions
        WHERE id = ?
      SQL
      return nil if question.empty?

      Questions.new(question.first)
    end

    def find_by_author_id(author_id)
      questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT *
        FROM questions
        where author_id = ?
      SQL
      return nil if questions.empty?

      questions.map! { |question| Questions.new(question) }
    end
  end

  attr_reader :id, :author_id
  attr_accessor :title, :body

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
end

class QuestionFollows
  class << self
    def find_by_id(id)
      follow = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM question_follows
        WHERE id = ?
      SQL
      return nil if follow.empty?

      QuestionFollows.new(follow.first)
    end
  end

  attr_reader :id, :following_user_id, :following_question_id

  def initialize(options)
    @id = options['id']
    @following_user_id = options['following_user_id']
    @following_question_id = options['following_question_id']
  end
end

class Replies
  class << self
    def find_by_id(id)
      reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE id = ?
      SQL
      return nil if reply.empty?

      Replies.new(reply.first)
    end

    def find_by_user_id(id)
      replies = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE user_id = ?
      SQL
      return nil if replies.empty?

      replies.map! { |reply| Replies.new(reply) }
    end

    def find_by_question_id(id)
      replies = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE question_id = ?
      SQL
      return nil if replies.empty?

      replies.map! { |reply| Replies.new(reply) }
    end
  end

  attr_reader :id, :question_id, :parent_reply_id, :user_id
  attr_accessor :body

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
  end
end

class QuestionLikes
  class << self
    def find_by_id(id)
      like = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM question_likes
        WHERE id = ?
      SQL
      return nil if like.empty?

      QuestionLikes.new(like.first)
    end
  end

  attr_reader :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
