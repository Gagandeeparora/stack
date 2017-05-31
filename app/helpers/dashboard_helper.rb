module DashboardHelper
	def user_name question
		User.find(question.user_id).user_name 
	end
end
