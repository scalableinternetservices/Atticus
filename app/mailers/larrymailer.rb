class Larrymailer < ApplicationMailer
      default from: 'automated@atticus.com'

      def contract_accepted(user, contract)
      	  @user = user
	  @contract = contract
	  mail(to: @user.email, subject:'Your pending contract has been accepted!')
      end
      
      def contract_pending(user, company, contract)
      	  @user = user
	  @contract = contract
	  @company = company
	  subjectline = @user.first_name + ' ' +  @user.last_name + ' has accepted your contract!' 
	  mail(to:@company.email, subject:subjectline)
      end

      def contract_finished(user, company, contract)
      	  @user = user
      	  @company = company
	  @contract = contract
	  subjectline = @user.first_name + ' ' + @user.last_name + ' has finished the contract work!'
	  mail(to:@company.email, subject:subjectline)
      end

      def contract_approved(user, contract)
      	  @user = user
	  @contract = contract
	  mail(to:@user.email, subject:'Your work on the contract has been approved!')
      end
	  
end
