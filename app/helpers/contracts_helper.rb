module ContractsHelper
  def cache_key_for_contracts
    "contracts-#{Contract.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}"
  end

  def cache_key_for_contract_row(contract)
    "contract-#{contract.id}-#{contract.updated_at}-#{contract.comments.count}"
  end
end
