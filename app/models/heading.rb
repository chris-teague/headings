class Heading < ActiveRecord::Base

  belongs_to :project

  DefaultStatusTypes = [
    'Available',
    'No Vent/ High Radiation ',
    'Mining Towards Heading Hazard zone ',
    'Interaction With Other Department',
    'Rehab/Geotech Inspection',
    'No Services Installed',
    'Laser/Package',
    'Site Dewatering',
    'Site Completed',
    'No J-Box',
    'Escalated to Different Site',
    'Development Re-alignment',
    'Completing Unfinished Scheduled Site',
    'D&B',
    'Scheduled MOP Outage',
    'Unplanned MOP Interaction',
    'Rehab to be completed',
    'To Set Up',
    'Design/MD Approval/Hazard',
    'Stripping',
    'Complete',
    'Mining Towards',
    'Unavailable'
  ]

  def pin_colour
    case status
    when '1', 'Available' then 'Green'
    else
      'Red'
    end
  end


  def staff
    [1,2,3]
  end

end
