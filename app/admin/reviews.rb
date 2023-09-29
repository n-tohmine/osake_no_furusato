ActiveAdmin.register Review do
  controller do
    def scoped_collection
      super.eager_load(:user, :brewery)
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :brewery_id, :user_id
  #
  # or
  #
  permit_params do
    permitted = %i[content star visit_date brewery_id user_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  form do |f|
    f.inputs 'Review Details' do
      f.input :content
      f.input :star
      f.input :visit_date, as: :date_select, start_year: 2000, end_year: Time.now.year
    end
    f.actions
  end
end
