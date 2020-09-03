module Organizational
  extend ActiveSupport::Concern

  class UnknownOrganization < StandardError
  end

  def require_organization!
    raise UnknownOrganization.new if current_organization.nil?
  end

  def current_organization
    current_user&.casa_org
  end
end