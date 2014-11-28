class FixMinuteIssue < ActiveRecord::Migration
  def change
  	add_column :submissions, :result_string, :string
  	add_column :submissions, :result_millis, :int
  	Submissions.all.each do |sub|
  		sub.result_string = sub.result
  		sub.result_millis = sub.result * 1000
  	end
  end
end
