class User < ActiveRecord::Base
    has_many :rams 
    has_many :trees 
    has_many :trouts
end