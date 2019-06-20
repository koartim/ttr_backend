class UserSerializer < ActiveModel::Serializer
    # has_many :scores
    attributes :first_name, :last_name, :user_name
end
