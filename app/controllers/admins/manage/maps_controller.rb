class Admins::Manage::MapsController < Admins::BaseController
    #before_action :get_shipment, only: [:create, :index, :update]
     def index
        @maps = TessatMap.all.order(file_date: :desc)
     end
 
     def show
        @map = TessatMap.find_by_id params[:id]
     end
 
     def new
        
     end
 
     def create
     # @company = Company.new(company_params)
     #respond_to do |format|
     #  if @company.save
     #    current_user.update_attributes(company_id: @company.id)
     #    format.html { redirect_to request.referrer, notice: 'Company was successfully created.' }
     #    format.json { render :show, status: :created, location: @question }
     #  else
     #    format.html { render :new }
     #    format.json { render json: @company.errors, status: :unprocessable_entity }
     #  end
     #end
     end
 
     def update
         #if @company.update_attributes(company_params)
         #    respond_to do |format|
         #        format.html { redirect_to request.referrer, :flash => {:success => 'Successful updated company.'}}
         #        format.json { render :json => @company }
         #    end
         #else
         #    flash[:danger] = @company.errors.full_messages.first
         #    redirect_to request.referrer
         #end
     end
 
     def destroy
     end

     def sync_data
        s3 = Aws::S3::Client.new
        resp = s3.list_objects(bucket: 'tessat-uniten')
        resp.contents.each do |object|
            puts "Saving datafile #{object.key}"
            key = object.key.gsub!(/\./,",")
            merge = key.split(',')
            @map = TessatMap.find_by_data_id merge[2]
            unless @map.present?
                puts "Id : #{merge[2]}"
                puts "File : #{merge[0]}"
                puts "Date : #{Date.strptime(merge[1],"%Y%m%d")}" 
                TessatMap.create! data_id: merge[2], file_name: merge[0], file_date: Date.strptime(merge[1],"%Y%m%d"), full_name: key.gsub!(/\,/,".")
            end
        end
        render json: 200
     end
 
     private
 
     def get_shipment
 
            # @company = Company.find(current_user.company_id)
        
     end
 
     def shipment_params
         params.require(:shipment).permit()
     end
 
 end