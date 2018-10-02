=begin
schedulable?に応答することが期待されるオブジェクトはBicycleだけではない。
MechanicとVehicleも。
=end
module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
end