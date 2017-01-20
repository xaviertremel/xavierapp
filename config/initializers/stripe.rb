if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_AB1yoaNQ5T5jfqVWlRo1gPfz',
    :secret_key => 'sk_test_nF35W8vRARWdXfdJ7znTHqDw'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]