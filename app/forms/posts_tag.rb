class PostsTag

  include ActiveModel::Model
  attr_accessor :name, :text, :image, :tagname, :user_id

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :tagname
  end

  def save
    post = Post.create(name: name, text: text, image: image, user_id: user_id)
    tag = Tag.where(tagname: tagname).first_or_initialize
    tag.save

    PostTag.create(post_id: post.id, tag_id: tag.id, user_id: user_id)
  end

end