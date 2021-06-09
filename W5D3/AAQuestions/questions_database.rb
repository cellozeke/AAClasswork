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

class User
  class << self
    def find_by_id(id)
      user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM users
        WHERE id = ?
      SQL
      return nil if user.empty?

      User.new(user.first)
    end

    def find_by_name(fname, lname)
      users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT *
        FROM users
        WHERE fname = ? AND lname = ?
      SQL
      return nil if users.empty?

      users.map! { |user| User.new(user) }
    end
  end

  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end
end

class Question
  class << self
    def find_by_id(id)
      question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM questions
        WHERE id = ?
      SQL
      return nil if question.empty?

      Question.new(question.first)
    end

    def find_by_author_id(author_id)
      questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT *
        FROM questions
        where author_id = ?
      SQL
      return nil if questions.empty?

      questions.map! { |question| Question.new(question) }
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

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end
end

class QuestionFollow
  class << self
    def find_by_id(id)
      follow = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM question_follows
        WHERE id = ?
      SQL
      return nil if follow.empty?

      QuestionFollow.new(follow.first)
    end

    def followers_for_question_id(question_id)
      followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT users.id, users.fname, users.lname
        FROM users
        JOIN question_follows ON users.id = question_follows.following_user_id
        WHERE question_follows.following_question_id = ?
      SQL
      return nil if followers.empty?

      followers.map! { |follower| User.new(follower) }
    end

    def followed_questions_for_user_id(user_id)
      questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT questions.id, questions.title, questions.body, questions.author_id
        FROM questions
        JOIN question_follows ON questions.id = question_follows.following_question_id
        WHERE question_follows.following_user_id = ?
      SQL
      return nil if questions.empty?

      questions.map! { |question| Question.new(question) }
    end
  end

  # attr_reader :id, :following_user_id, :following_question_id

  # def initialize(options)
  #   @id = options['id']
  #   @following_user_id = options['following_user_id']
  #   @following_question_id = options['following_question_id']
  # end
end

class Reply
  class << self
    def find_by_id(id)
      reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE id = ?
      SQL
      return nil if reply.empty?

      Reply.new(reply.first)
    end

    def find_by_user_id(id)
      replies = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE user_id = ?
      SQL
      return nil if replies.empty?

      replies.map! { |reply| Reply.new(reply) }
    end

    def find_by_question_id(id)
      replies = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE question_id = ?
      SQL
      return nil if replies.empty?

      replies.map! { |reply| Reply.new(reply) }
    end

    def find_by_parent_reply_id(id)
      replies = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE parent_reply_id = ?
      SQL
      return nil if replies.empty?

      replies.map! { |reply| Reply.new(reply) }
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

  def author
    User.find_by_id(user_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_reply_id)
  end

  def child_replies
    Reply.find_by_parent_reply_id(id)
  end
end

class QuestionLike
  class << self
    def find_by_id(id)
      like = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM question_likes
        WHERE id = ?
      SQL
      return nil if like.empty?

      QuestionLike.new(like.first)
    end
  end

  attr_reader :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
