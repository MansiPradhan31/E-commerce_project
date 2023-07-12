class UserDetail
  def initialize(name,add,con,bank,num,cvv)
    @name = name
    @add = add
    @con = con
    @bank = bank
    @num = num 
    @cvv = cvv
  end
  attr_accessor :name, :add, :con, :bank, :num, :cvv  
end
  