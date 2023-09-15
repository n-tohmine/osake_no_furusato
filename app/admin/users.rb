ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :crypted_password, :salt, :name, :avatar, :remove_avatar, :living_place, :favorite_liquor_type, :self_introduction, :role, :reset_password_token, :reset_password_token_expires_at, :reset_password_email_sent_at, :access_count_to_reset_password_page
  #
  # or
  permit_params do
    permitted = %i[email name avatar avatar_cache remove_avatar living_place favorite_liquor_type self_introduction role]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  # Customize form for delete avatar
  form do |f|
    f.inputs 'Users' do
      f.input :name
      f.input :email
      f.input :avatar, as: :file, hint: f.object.avatar.present? ? image_tag(f.object.avatar.url) : nil
      if f.object.avatar.present?
        f.input :remove_avatar, as: :boolean, required: false, label: '画像を削除する'
      end
      f.input :living_place, as: :select, collection: User.prefecture_enums
      f.input :favorite_liquor_type
      f.input :self_introduction
      f.input :role
    end
    f.actions
  end

  # Customize show for showing avatar image
  show do |_item_image|
    attributes_table do
      row :id
      row :name
      row :email
      row :avatar do
        image_tag(user.avatar.url, style: 'max-width: 200px;')
      end
      row :living_place do
        User.prefecture_enums.key(user.living_place)
      end
      row :favorite_liquor_type
      row :self_introduction
      row :role
      row :reset_password_token
      row :crypted_password
      row :salt
      row :reset_password_token_expires_at
      row :reset_password_email_sent_at
      row :access_count_to_reset_password_page
    end
  end

  index do
    selectable_column
    column :id
    column :name
    column :email
    column :avatar do |user|
      image_tag(user.avatar.url, style: 'max-width: 50px;')
    end
    column :living_place do |user|
      User.prefecture_enums.key(user.living_place)
    end
    column :favorite_liquor_type
    column :self_introduction
    column :role
    actions 
  end
end
