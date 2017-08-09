class UserMailer < ApplicationMailer
	default from: "tenpinactionproshop.herokuapp.com"

	def contact_form(email, name, message)
		@message = message
			mail(from: email, 
						to: 'e_ryan1@yahoo.com',
						subject: "A nw contact form message from #{name}")
	end

	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		UserMailer.contact_form(@email, @name, @message).deliver_now
	end
end
