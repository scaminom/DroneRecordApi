class UserSerializer < Panko::Serializer
  attributes :id,
             :username,
             :email,
             :first_name,
             :last_name,
             :role
end
