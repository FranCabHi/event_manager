class Concert < ApplicationRecord
  belongs_to :group

  def group_names
    group.group_name
  end

end
