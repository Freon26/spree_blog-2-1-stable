object false
node(:count) { @posts.count }
child(@posts) do
  extends 'spree/api/posts/show'
end
