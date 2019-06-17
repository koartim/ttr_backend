class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :level_one, :level_two, :user_first_name
  # belongs_to :user
end
