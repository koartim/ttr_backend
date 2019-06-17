class Score < ApplicationRecord
  belongs_to :user

  def user_first_name
    self.user.first_name
  end
end
