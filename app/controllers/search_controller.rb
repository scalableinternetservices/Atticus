class SearchController < ApplicationController
    def search
        if params[:q].nil?
            @contracts = []
        else
            @contracts = Contract.search(params[:q])
        end
    end
end
