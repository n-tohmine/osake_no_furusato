ActiveAdmin.register Like do
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
  # permit_params :brewery_id, :user_id
  #
  # or
  #
  permit_params do
    permitted = %i[brewery_id user_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
