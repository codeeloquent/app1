class PaymentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@product = Product.find(params[:product_id])

		if user_signed_in?
			@user = curreent_user
		else
			redirect_to new_user_registration_path
		end

		token = params[:stripeToken]
		# Create the charge on Stripe's servers - this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				amount: @product.price * 100, # amount in cents, again
				currency: "usd",
				source: token,
				descriptoin: params[:stripeEmail]
				)
		if charge.paid
			order.create(
				user_id: @user_id,
				product_id: params[:product_id],
				total: @product.price.to_i
			)
			flash[:notice] = "Thank you for purchasing #{@product.name}!"
		end

		rescue Stripe::CardError => e
			# The card has been denied
			body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

		redirect_to product_path(@product)
	end
end
