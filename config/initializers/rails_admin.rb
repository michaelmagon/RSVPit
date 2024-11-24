RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  config.parent_controller = 'ApplicationController'

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Guest' do
    list do
      field :name
      field :show_in_app do
        pretty_value do
          link = "#{bindings[:object]&.event&.host}/guests/#{bindings[:object].slug}"
          bindings[:view].button_to('Copy Link', '#', type: 'button', onclick: "navigator.clipboard.writeText('#{link}'); return false;")
        end
        formatted_value do
          link = "#{bindings[:object].event.host}/guests/#{bindings[:object].slug}"
          bindings[:view].button_to('Copy Link', '#', type: 'button', onclick: "navigator.clipboard.writeText('#{link}'); return false;")
        end
      end
      field :email
      field :slug
      field :is_attending
      field :number_of_seats
      field :seats_attending
      field :event
    end
    edit do
      field :first_name
      field :last_name
      field :email
      field :phone_number
      field :number_of_seats
      field :is_attending
      field :event
    end
    show do
      field :name
      field :email
      field :slug
      field :is_attending
      field :number_of_seats
      field :seats_attending
      field :event
      field :show_in_app do
        pretty_value do
          bindings[:view].link_to('Show in App', "/guests/#{(bindings[:object].slug)}")
        end
        formatted_value do
          bindings[:view].link_to('Show in App', "/guests/#{(bindings[:object].slug)}")
        end
      end
    end

  end

  config.model 'Event' do
    list do
      field :name
      field :happening_on
      field "Total Invited" do
        pretty_value do
          bindings[:object].guests.count
        end
      end

      field "Total Attending" do
        pretty_value do
          bindings[:object].guests.where(is_attending: 'attending').count
        end
      end

      field "Total Not Attending" do
        pretty_value do
          bindings[:object].guests.where(is_attending: 'not_attending').count
        end
      end

      field "Total Unanswered" do
        pretty_value do
          bindings[:object].guests.where(is_attending: 'undecided').count
        end
      end
    end

    edit do
      field :name
      field :happening_on
      field :host
      field :site_title
      field :guests
    end
    show do
      field :name
      field :happening_on
      field :guests
    end
  end

  config.model 'Guest' do

  end
end
