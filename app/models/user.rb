class User < ActiveRecord::Base
  attr_accessor :login
  has_many :shouts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email = :value)", {:value => login.downcase}]).first
    else
      where(conditions.to_hash)
    end
  end
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
end
