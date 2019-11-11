class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      input = User.last.id
      new_user_profile_path(id: input)
    elsif resource.is_a?(Vet)
      input = Vet.last.id
      new_vet_profile_path(id: input)
    else
      super
    end
  end
end
