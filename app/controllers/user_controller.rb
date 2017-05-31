class UserController < ApplicationController
	before_action :authenticate_user, :except => [:upload_answer,:new,:create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
  	if @user.save
  		redirect_to root_path
  		flash[:success] = "New User Profile Created"
  	else
  		redirect_to new_user_path
  		flash[:notice] = @user.errors.full_messages.first		
  	end
	end


	def upload_question
		@question = Question.new
	end

	def post_question
		@ques = current_user.questions.build(question_params)
		if @ques.save
			redirect_to root_path
  		flash[:success] = "Question Uploaded Successfully"
  	else
  		redirect_to root_path
  		flash[:notice] = @ques.errors.full_messages.first 		
  	end		
	end

	def upload_answer
		@question = Question.find(params[:id])
		@answers = @question.answers || []
		@answer = Answer.new
	end

	def post_answer
		@ques = Question.find(params[:question_id])
		@answer = @ques.answers.build(answer_params)
		if @answer.save
			redirect_to root_path
  		flash[:success] = "Answer Uploaded Successfully"
  	else
  		redirect_to root_path
  		flash[:notice] = @answer.errors.full_messages.first		
  	end	
	end

	# def tags
	# 	@tags =  
	# end

	private

  def authenticate_user
  	unless current_user
  		redirect_to login_session_index_path, notice: "Please login to continue."
  	end
  end	

	def question_params
		params.require(:question).permit(:question, :tag)
	end

	def answer_params
		params.require(:answer).permit(:ans)
	end

	def user_params
		params.require(:user).permit(:name, :user_name, :email, :password)
	end
end
