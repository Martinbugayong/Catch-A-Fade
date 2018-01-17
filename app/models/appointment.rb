class Appointment < ApplicationRecord
    #enum is setting limits to the time selection (database validation)
    enum time:['1','2','3','4','5','6','7']

end
