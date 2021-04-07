class FamilyDetailsController < ApplicationController
  # skip_before_action :ensure_logged_in

  # /patients/:patient_id/family_details
  def index
    @patient = Patient.find_by_id(params[:id])
    render "patients/family_tree/form"
  end

  def update
    @patient = Patient.find_by_id(params[:id])
    @patient.update_family_member(params[:familyDetails], params[:id])
    # Get /patients/:id
    redirect_to patient_path
  end
end
