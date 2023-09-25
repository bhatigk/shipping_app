# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        # Assign the selected role to the user during registration
        if params[:user][:roles].present?
          resource.add_role(params[:user][:roles])
          resource.type = params[:user][:roles].try(&:titleize).gsub(" ", "")
        end
      end
    end
  end
end
