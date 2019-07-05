class DocsController < ApplicationController
  before_action :authenticate_user!, only: [:unsubscribe]
  def question
  end

  def unsubscribe
  end

  def terms
  end

  def privacy_policy
  end
end
