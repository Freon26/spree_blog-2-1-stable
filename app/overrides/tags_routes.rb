Deface::Override.new(:virtual_path => "spree/admin/shared/_routes",
                     :name => "tags_routes",
                     :insert_after => "script",
                     :text => "<script>Spree.routes.tags_search = '<%= spree.api_tags_url %>'; Spree.routes.posts_search = '<%= spree.api_posts_url %>'</script>")
