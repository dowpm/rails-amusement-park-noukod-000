class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    happiness - nausea > 0 ? "happy" : "sad" if happiness && nausea
  end
end
