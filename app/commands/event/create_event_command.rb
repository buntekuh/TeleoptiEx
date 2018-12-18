module Event
  #
  # Validates the sign-in form and finds the user to sign in
  # @author buntekuh
  class CreateEventCommand < BaseCommand

    private_attr_accessor :calendar, :data

    # @param form [UserPasswordAuthenticationForm]
    def initialize(calendar, data)
      self.calendar = calendar
      self.data = data
    end

    #
    # [signs in user]
    #
    # @return [Event] [the newly created event]
    # @raise [InvalidEvent] [unless the data is valid]
    #
    def execute
      
    end
  end
end
