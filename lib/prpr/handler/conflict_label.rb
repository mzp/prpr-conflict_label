module Prpr
  module Handler
    class ConflictLabel < Base
      handle Event::Push do
        Action::ConflictLabel::CheckAll.new(event).call
      end
    end
  end
end
