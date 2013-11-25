object false
node(:count) { @tags.count }
child(@tags) do
  extends 'spree/api/tags/show'
end
