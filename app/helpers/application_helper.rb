module ApplicationHelper
  def active_menu(options = {})
    ActiveMenuService.new(controller, options).exec
  end

  def currencies
    ISO3166::Country.all.map(&:currency_code).uniq
  end

  def open_popup(title: nil, partial: nil, locals: {}, popup: nil)
    render partial: popup || 'popups/popup', locals: { title: title, render_path: partial, locals: locals }
  end
end
