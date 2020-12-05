namespace :file do
  desc 'Get file and process'
  task process: :environment do
    puts 'Starting process file'
    FileService.new.call
    puts 'Finished process file'
  end
end