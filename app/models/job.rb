class Job < ApplicationRecord

	#after_initialize :set_defaults, unless: :persisted?

	belongs_to :user
	has_many :resumes
	validates :title, presence: true
	validates :wage_upper_bound, numericality: true
	# validates :wage_lower_bound, presence: true   如果对一个栏位的属性写两个validates 只有前一个会起作用
	validates :wage_lower_bound, numericality: { greater_than: 0}

	# 简化controller中的代码的便宜形式
	scope :published, -> { where(is_hidden: false)}
	scope :recent, -> { order('created_at DESC')}
	
	# #按照薪资上限排列
	# scope :recent2, -> { order("wage_upper_bound DESC")}

	# #按照薪资下限排列
	# scope :recent3, -> { order("wage_lower_bound DESC")}

	def publish!
		self.is_hidden = false
		self.save
	end

	def hide!
		self.is_hidden = true
		self.save
	end

	#def set_defaults
	#	self.contact_email ||= 'xxx@163.com'
	#end
end
