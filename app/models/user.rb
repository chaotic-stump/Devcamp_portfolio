class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name

  def first_name
    self.name.split.first
  end
  
  def last_name
    self.name.split.last
  end
end


def get_facebook_messages
  begin
    contacts_fb
    @messages = retrieves_messages
  rescue IOError => e
    flash[:error] = "Error occured contacting Facebook: #{e}"
  end
end