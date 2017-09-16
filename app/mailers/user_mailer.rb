class UserMailer < ApplicationMailer
	default from: "ff.computing@gmail.com"

	def contact_form(email, name, message)
		@message = message
			mail(from: email, 
						to: 'ff.computing@gmail.com',
						subject: "A new contact form message from #{name}").deliver_now
	end

	def send_mail
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		UserMailer.contact_form(@email, @name, @message).deliver_now
		redirect_to contact_path, notice: 'Message sent'
	end
		
	def welcome(user)		
		@appname = "Ten Pin Action Pro Shop"
		mail to: user.email, subject: "Welcome to #{@appname}!"
	end
	
	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		UserMailer.contact_form(@email, @name, @message).deliver_now
	end
end