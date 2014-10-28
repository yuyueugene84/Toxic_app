class Brand < ActiveRecord::Base
	
	belongs_to :owner, :class_name => "User", :foreign_key => :user_id


	has_many :products
	belongs_to :user

	validates :brand_cname, :presence => true
	validates :brand_name, :presence => true
	#validates :user_id, :presence => true

	def editable_by?(user)
    	user && user == owner
	end
end
