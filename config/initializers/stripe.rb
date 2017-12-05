#if Rails.env.production?
#	Rails.configuration.stripe = {
#		publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
#		secret_key: ENV['STRIPE-SECRET_KEY']
#	}
#else
	Rails.configuration.stripe = {
		publishable_key: 'pk_test_QoV9igIsubrU60vLgkNk7zPY',
		secret_key: 'sk_test_YkONf9lzstwT4mzI7sTp4CNQ'
	}
#end

Stripe.api_key = Rails.configuration.stripe[:secret_key]