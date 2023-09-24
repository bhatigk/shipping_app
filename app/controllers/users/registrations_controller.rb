# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        # Assign the selected role to the user during registration
        resource.add_role(params[:user][:roles]) if params[:user][:roles].present?
      end
    end
  end
end
