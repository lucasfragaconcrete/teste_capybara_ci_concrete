Dado('que eu acessei o bazar') do
  visit '/'
end

Dado('que eu tenha um email valido') do
  $email = Faker::Internet.email
end

Quando('digitar o email para receber ofertas') do
    home.enviar_email($email)
end

Então("devo receber a mensagem de sucesso {string}") do |mensagem|
    expect(page).to have_css("div[class='coluna span3 esquerda'] div[class='newsletter-confirmacao'] span", text: mensagem)
end

Então("devo receber a critica {string}") do |mensagem|
    expect(page).to have_css("p[class='alert alert-error erro-newsletter text-error']", text: mensagem)
end

Dado('que eu tenha um email invalido') do
    @email_invalido = "concrete@email_invalido"
end

Quando("digitar o email invalido para receber ofertas") do
    home.enviar_email(@email_invalido)
end
