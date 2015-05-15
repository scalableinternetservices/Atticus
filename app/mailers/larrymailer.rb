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
	  @subjectline = @user.first_name + ' ' +  @user.last_name + ' has accepted your contract!' 
	  mail(to:@company.email, subject:@subjectline)
      end
end
