namespace :s3 do
    desc "Retrieve map from s3"

    task :retrieve_map_data => :environment do
        puts "Retrieve map data from s3 and save into database"
        max_file = 99999999 if Rails.env.production?
        max_file = 2 if Rails.env.development?
        s3 = Aws::S3::Client.new
        resp = s3.list_objects(bucket: 'tessat-uniten', max_keys: max_file)
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
    end
end