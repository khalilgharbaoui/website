module OrdersHelper
  def payment_link_to(text, order, options = {})
    # We set the host and port here because Mollie does not accept local hosts.
    payment_options = { redirectUrl: thanks_enroll_url(order, host: Rails.application.config.hosts[I18n.locale]) }
    payment_options[:webhookUrl] = webhook_enroll_index_url(host: 'www.developmentbootcamp.nl')
    payment = order.create_payment payment_options
    link_to text, payment.getPaymentUrl, options
  end

  def order_step_name(step)
    if step =~ /^students/
      nr = step.split('-').last.to_i + 1
      "Student Details #{nr}"
    elsif step == 'tickets'
      "Choose Tickets"
    elsif step == 'details'
      "Billing Information"
    elsif step == 'confirmation'
      "Confirmation"
    end
  end

  def order_step_icon(step)
    if step =~ /^students/
      fa_icon 'user fw'
    elsif step == 'tickets'
      fa_icon 'ticket fw'
    elsif step == 'details'
      fa_icon 'globe fw'
    elsif step == 'confirmation'
      fa_icon 'check fw'
    end
  end
end
