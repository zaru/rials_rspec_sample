class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def nameAddr
    "%s<%s>" % [name, email]
  end
end
