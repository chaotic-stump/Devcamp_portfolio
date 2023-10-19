module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "http://placehold.co/#{height}x#{width}"
  end
end