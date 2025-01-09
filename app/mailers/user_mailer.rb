class UserMailer < ApplicationMailer
    def welcome_email(user)
       @user = user
       mail(to: @user.email, subject: "Welcome to Capivis App!")
    end

     def questionnaire_submission_confirmation(user)
       @user = user
         mail(to: @user.email, subject: "Thank you for submitting your responses")
     end

     def screening_completed_email(donor)
       @donor = donor
       mail(to: @donor.user.email, subject: "Your Screening is Complete")
     end 

     def physical_exam_completed(donor)
      @donor = donor
      mail(to: @donor.user.email, subject: "Your Screening is Complete")
     end

end
