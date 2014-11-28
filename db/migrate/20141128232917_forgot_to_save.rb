class ForgotToSave < ActiveRecord::Migration
  def change
  	Submission.all.each do |sub|
  		sub.result_string = sub.result
  		sub.result_millis = sub.result * 1000
  		sub.save()
  	end
  end
end
