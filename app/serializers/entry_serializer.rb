class EntrySerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :page_id, :anonymous, :display_text, :user_pen_color

  def user_pen_color
  	object.user.pen_color
  end

end
