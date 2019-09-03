class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :location, :email
end
