class PageSerializer < ActiveModel::Serializer
  attributes :id, :title, :back_url, :next_url
  has_many :entries
end
