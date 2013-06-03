class FavoriteSerializer < ActiveModel::Serializer
  #attributes :id, :cut_id

  has_one :user
  has_one :cut 
end
