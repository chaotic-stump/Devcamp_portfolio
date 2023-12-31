class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy, inverse_of: :portfolio
  accepts_nested_attributes_for :technologies,    
                                allow_destroy: true,
                                reject_if: :all_blank

  include Placeholder
  validates_presence_of :title, :body

  acts_as_list

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  

  # custom scopes
  def self.angular
    Portfolio.where(subtitle: "Angular")
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }
end
