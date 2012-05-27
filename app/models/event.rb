class Event < ActiveRecord::Base

	default_scope order: 'events.date ASC'
end
