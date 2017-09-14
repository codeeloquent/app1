FactoryGirl.define do

	sequence(:email) {|n| "user#{n}@example.com"}

	factory :user do
		email
		password "boyoho"
		first_name "Jake"
		last_name "Schipp"
		admin false
	end
end