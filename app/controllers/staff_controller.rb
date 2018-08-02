class StaffController < ApplicationController
    def index
        @staff = Group.staff
                      .flat_map(&:members)
                      .uniq
                      .map{|member| [member, member.primary_group]}
                      .shuffle
    end
end
