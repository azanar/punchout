require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:unit) do |t|
    t.test_files = FileList['test/unit/**/*_test.rb']
    t.verbose = true
  end
  Rake::TestTask.new(:integration) do |t|
    t.test_files = FileList['test/integration/**/*_test.rb']
    t.verbose = true
  end
end

task :test do |tt|
  ["test:unit", "test:integration"].each do |t|
    Rake::Task[t].execute
  end
end
