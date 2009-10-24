module SiteHelper
  def website
    @website ||= Site.first
  end
end