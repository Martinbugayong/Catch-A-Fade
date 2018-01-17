class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]
    before_action :authorize, except: [:index, :show]
    def index 
        @appointments = Appointment.all 
    end
    def show 
    end

    def new
        @appointment = Appointment.new
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def create
        @appointment = Appointment.new(appointment_params)
        respond_to do |format|
            if @appointment.save
                format.html { redirect_to @appointment, notice: 'Appointment was sucessfully booked.'}
            else
                format.html { render :new }
            end
        end
    end


    def update 
        @appointment = Appointment.find(params[:id])

        if @appointment.update_attributes(appointment_params)
            redirect_to appointments_path 
        else 
            render :edit 
        end
        
    end

    def destroy 
        @appointment.destroy
        respond_to do |format|
            format.html { redirect_to appointments_url, notice: 'Appointment was sucessfully destroyed.'}
        end
    end

    private
        def set_appointment
            @appointment = Appointment.find(params[:id])
        end

        def appointment_params
            params.require(:appointment).permit(:details, :time, :date)
        end

end
