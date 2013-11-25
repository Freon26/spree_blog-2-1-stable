Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "blog_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:posts, :label => 'Posts', :icon => 'icon-file') %>")
