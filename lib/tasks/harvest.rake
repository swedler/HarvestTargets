namespace :harvest do
  desc "get all the projects and store them in the database"
  task :get_projects  => :environment do 
    harvest = Harvest.new
    response = harvest.request  '/projects', :get

    hash = Hash.from_xml(response.body)
    projects = hash['projects'].select{|project| project['active'] == true}
    projects.each do |project|
      create_args = {:name => project["name"], :harvest_id => project["id"]}
      if p = Project.find_by_harvest_id(project['id'])
        p.update_attribute("updated_at", Time.now)
      else
        Project.create(create_args)
      end
    end
  end
  
  desc "get all time for each project"
  task :get_hours => :environment do
    projects = Project.find(:all, :conditions => ["updated_at >= ?", Time.now.beginning_of_week])
    start_date = Time.now.beginning_of_week.strftime("%Y%m%d")
    end_date = Time.now.end_of_week.strftime("%Y%m%d")
    
    harvest = Harvest.new
    projects.each do |project|
      response = harvest.request "/projects/#{project.harvest_id}/entries?from=#{start_date}&to=#{end_date}"
      hash = Hash.from_xml(response.body)
      hours = hash['day_entries']
      
      hours.each do |hour|
        user_id = hour['user_id'].to_i
        task_id = hour['task_id'].to_i
        entry_id = hour['id'].to_i
        hours = hour['hours'].to_f
        date = hour['spent_at']
        
        create_args = { :harvest_project_id => project.harvest_id, 
                        :harvest_entry_id => entry_id, 
                        :harvest_task_id => task_id, 
                        :harvest_user_id => user_id, 
                        :hours => hours, 
                        :date => date }
                        
        if e = TimeEntry.find_by_harvest_entry_id(entry_id)
          e.update_attributes(create_args)
        else
          TimeEntry.create(create_args)
        end
      end
    end
  end
  
  desc "get all users from harvest"
  task :get_people => :environment do
    harvest = Harvest.new
    response = harvest.request "/people"
    hash = Hash.from_xml(response.body)
    people = hash['users']
    
    people.each do |person|
      user_id = person['id']
      first_name = person['first_name']
      last_name = person['last_name']
      create_args = {:harvest_user_id => user_id, :first_name => first_name, :last_name => last_name}
      if p = Person.find_by_harvest_user_id(user_id)
        p.update_attributes(create_args)
      else
        Person.create(create_args)
      end
    end
    
  end
  
end