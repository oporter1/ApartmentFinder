class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    person = Person.from_omniauth(request.env["omniauth.auth"])
    if person.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect person
    else
      session["devise.person_attributes"] = person.attributes
      redirect_to new_person_registration_url
    end
  end
  alias_method :twitter, :all
end
