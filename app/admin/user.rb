ActiveAdmin.register User do
  permit_params :email, :name, :initials, :username, :locale, :time_zone, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :initials
    column :username
  end

  filter :email
  filter :name
  filter :username

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :initials
      f.input :username
      f.input :locale, collection: I18n.available_locales
      f.input :time_zone
    end
    f.actions
  end

  sidebar "Team Details", only: [:show, :edit] do
    ul do
      li link_to "Memberships", manage_user_memberships_path(resource)
      li link_to "Enrollments", manage_user_enrollments_path(resource)
    end
  end
end
