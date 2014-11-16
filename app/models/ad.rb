class Ad < ActiveRecord::Base
	before_save :default_values
	def default_values
		self.ad ||= true
		self.headline ||= 'Sponsored Content'
		self.content ||= ''
	end
end