class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            flash[:success]="Message has been sent."
            redirect_to new_contact_path
        else
            flash[:danger]="Message hasn't been sent! The name and email fields can't be left blank."
            redirect_to new_contact_path
        end
    end
    
    private
        
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end