class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    characters = self.characters.pluck(:name)
    shows = self.shows.pluck(:name)
    roles = characters.zip(shows).map{|role| role.join(" - ")}
  end
end
