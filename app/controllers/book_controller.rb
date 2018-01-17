class BookController < 
    # put unauthorized until loged in actions here 
    before_action :authorize, except: [:index, :show]
end
