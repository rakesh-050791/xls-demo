class Meeting < ActiveRecord::Base
  attr_accessible :address, :building, :city, :country, :day, :description, :latitude, :longitude, :meeting_type, :name, :owner, :phone, :state, :status, :time, :zip

  def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    decoration = find_by_id(row["id"]) || new
	    decoration.attributes = row.to_hash.slice(*accessible_attributes)
	    decoration.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Csv.new(file.path, nil, :ignore)
	  when ".xls" then Excel.new(file.path, nil, :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end

	def self.to_csv(options = {})
	    CSV.generate(options) do |csv|
	      csv << ["Id","Name","Building","Address","City","State","Zip","Phone","Country","Meeting-Type","Day","Time","Description","Latitude","Longitude","Owner","Status"]
	      Meeting.all.each do |meeting|
	        csv << [meeting.id,meeting.name,meeting.building,meeting.address,meeting.city,meeting.state,meeting.zip,meeting.phone,meeting.country,meeting.meeting_type,meeting.day,meeting.time,meeting.description,meeting.latitude,meeting.longitude,meeting.owner,meeting.status]
	      end
	    end
	end



end
