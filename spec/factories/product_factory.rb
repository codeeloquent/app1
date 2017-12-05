FactoryGirl.define do
	sequence(:id) {|n| "#{n}"}

	factory :product do
		name "ball"
		description "round and bouncies"
		price "20"
		colour "multi swirl"
	end
end