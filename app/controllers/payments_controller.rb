class PaymentsController < ApplicationController

	def create
		token = params[:stripeToken]
		@product = Product.find(params[:product_id])
		@user = current_user

		# Create the charge on Stripe's servers - this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				:amount => @product.price * 100, # amount in cents, again
				:currenty => "usd",
				:source => token,
				:description => params[:stripeEmail]
				)

		if charge.paid
			order.create(
				:product_id => @prduct_id,
				:user_id => @user_id,
				:total => @product.price
			)
		end

		rescue Stripe::CardError => e
			# The card has been denied
			body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

		redirect_to static_pages_payment_thank_you_path
	end
end
