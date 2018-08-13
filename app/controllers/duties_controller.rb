class DutiesController < ApplicationController
    def create
        if @@employee.duties.build(duty_params).invalid?
            respond_to do |format|
                format.html do 
                    redirect_back(fallback_location: root_path, notice: "Duty can not be empty.")
                end
                format.json { head :no_content }
            end
            return
        end
            

        @duty = @@employee.duties.build(duty_params)
        if @duty.save
            flash[:success] = "Duty created!"
            #redirect_to employees_url
            redirect_back(fallback_location: employees_url)
        else
            render 'employees#index'
        end
    end

    def destroy
        @duty = Duty.find(params[:id])
        @duty.destroy
        respond_to do |format|
          format.html do 
            redirect_back(fallback_location: root_path, notice: "Employee was successfully created.")
          end

            format.json { head :no_content }
        end
    end


    def self.set_employee(employee)
        @@employee = employee
        ""
    end

    

    private
        def duty_params
            params.require(:duty).permit(:description)
        end

        def redirect_to_current_page
            redirect_back(fallback_location: employees_url)
        end
    
        
        def current_user()
            Employee.find_by(id: 1)
        end

        
end
