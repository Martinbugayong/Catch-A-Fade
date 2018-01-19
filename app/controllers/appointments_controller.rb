class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]
    before_action :authorize

    def index
        if (current_user && current_user.try(admin)
            @appointments = Appointment.where("date > ?", Date.yesterday)
        else
            @appointments = current_user.appointments 
        end
    end
    def show 
        @appointment = Appointment.find(params[:id])
    end

    def new
        @appointment = Appointment.new
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def create
        @appointment = Appointment.new(appointment_params)
        @appointment.user = current_user
        if @appointment.save
            redirect_to @appointment, notice: 'Your fade was sucessfully booked.'
        else
            render :new
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
            format.html { redirect_to appointments_url, notice: 'Fade was sucessfully canceled'}
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
