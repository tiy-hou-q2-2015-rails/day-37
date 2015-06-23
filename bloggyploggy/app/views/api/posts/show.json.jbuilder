json.(@post, :id, :title, :body, :published)
json.comments @post.comments, :id, :author, :content
