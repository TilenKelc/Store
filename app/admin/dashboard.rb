ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
          panel "PAYMENT ON DELIVERY - PENDING" do
            table_for Order.order("id desc").limit(10) do 
                column("State") do |a|
                  if a.status == "pending" && a.payment_option == "On delivery"
                    status_tag(a.status)
                  else
                    # class: "order_colS"
                  end
                end
                column("Customer") do |a|
                  if a.status == "pending" && a.payment_option == "On delivery"
                  link_to(a.customer.email, admin_customer_path(a.customer))
                  end
                end
                column("Total") do |a|
                  if a.status == "pending" && a.payment_option == "On delivery"
                  number_to_currency a.order_total
                  end
                end
                column("Change status") do |a|   
                  if a.status == "pending" && a.payment_option == "On delivery"
                  link_to("Edit status", edit_admin_order_url(a))
                  end
                end
          end
        end
      end

      column do
        panel "PAYMENT ON DELIVERY - PROCCESSING" do
          table_for Order.order("id desc").limit(10) do 
              column("State") do |a|
                if a.status == "processing" && a.payment_option == "On delivery"
                  status_tag(a.status)
                else
                  # class: "order_colS"
                end
              end
              column("Customer") do |a|
                if a.status == "processing" && a.payment_option == "On delivery"
                link_to(a.customer.email, admin_customer_path(a.customer))
                end
              end
              column("Total") do |a|
                if a.status == "processing" && a.payment_option == "On delivery"
                number_to_currency a.order_total
                end
              end
              column("Change status") do |a|   
                if a.status == "processing" && a.payment_option == "On delivery"
                link_to("Edit status", edit_admin_order_url(a))
                end
              end
        end
      end
    end

    column do
      panel "PAYMENT ON DELIVERY - COMPLETED" do
        table_for Order.order("id desc").limit(10) do 
            column("State") do |a|
              if a.status == "completed" && a.payment_option == "On delivery"
                status_tag(a.status)
              else
                # class: "order_colS"
              end
            end
            column("Customer") do |a|
              if a.status == "completed" && a.payment_option == "On delivery"
              link_to(a.customer.email, admin_customer_path(a.customer))
              end
            end
            column("Total") do |a|
              if a.status == "completed" && a.payment_option == "On delivery"
              number_to_currency a.order_total
              end
            end
            column("Change status") do |a|   
              if a.status == "completed" && a.payment_option == "On delivery"
              link_to("Edit status", edit_admin_order_url(a))
              end
            end
      end
    end
  end
end # columns

    columns do
      column do
        panel "CARD PAYMENT - COMPLETED" do
          table_for Order.order("id desc").limit(10) do 
              column("State") do |a|
                if a.status == "completed" && a.payment_option == "Credit card"
                  status_tag(a.status)
                else
                  # class: "order_colS"
                end
              end
              column("Customer") do |a|
                if a.status == "completed" && a.payment_option == "Credit card"
                link_to(a.customer.email, admin_customer_path(a.customer))
                end
              end
              column("Total") do |a|
                if a.status == "completed" && a.payment_option == "Credit card"
                number_to_currency a.order_total
                end
              end
        end
      end
      end

      column do
        panel "UNPAID ORDERS" do
          table_for Order.order("id desc").limit(10) do 
              column("State") do |a|
                if a.payment_option == "not paid"
                  status_tag("not paid")
                else
                  # class: "order_colS"
                end
              end
              column("Customer") do |a|
                if a.payment_option == "not paid"
                link_to(a.customer.email, admin_customer_path(a.customer))
                end
              end
              column("Total") do |a|
                if a.payment_option == "not paid"
                number_to_currency a.order_total
                end
              end
            end
        end
      end

      column do
        panel "RECENT ORDERS" do
          table_for Order.order("id desc").limit(10) do 
              column("State") do |a|
                if a.payment_option != "not paid"
                  status_tag(a.status)
                else
                  # class: "order_colS"
                end
              end
              column("Total") do |a|
                if a.payment_option != "not paid"
                  number_to_currency a.order_total
                end
              end
              column("Payment method") do |a|
                if a.payment_option != "not paid"
                a.payment_option
                end
              end
            end
        end
      end

      # column do
      #   panel "Recent Customers" do
      #     table_for Customer.order("id desc").limit(10).each do |_customer|
      #       column(:email)    { |customer| link_to(customer.email, admin_customer_path(customer)) }
      #     end
      #   end
      # end
    end # columns

    # columns do
    #   column do
    #     div do
    #       br
    #       text_node %{<iframe src="https://rpm.newrelic.com/public/charts/6VooNO2hKWB"
    #                           width="500" height="300" scrolling="no" frameborder="no">
    #                   </iframe>}.html_safe
    #     end
    #   end

      # column do
      #   panel "ActiveAdmin Demo" do
      #     div do
      #       render("/admin/sidebar_links", model: "dashboard")
      #     end
      #   end
      # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
