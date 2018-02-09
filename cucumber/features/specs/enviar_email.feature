#language: pt

Funcionalidade: Enviar email valido
    Eu, como cliente do bazar
    Quero receber as ofertas por email
    Logo, preciso de ter um email valido

    Contexto:
        Dado que eu acessei o bazar

    #@smoke
    Cenario: Enviar ofertas para email valido
        Dado que eu tenha um email valido
        Quando digitar o email para receber ofertas 
        Então devo receber a mensagem de sucesso "Obrigado por se inscrever! Aguarde novidades da nossa loja em breve."

    #@smoke
    Cenario: Alertar email ja cadastrado
        Quando digitar o email para receber ofertas
        Então devo receber a critica "Seu e-mail já consta em nossa newsletter."

    @smoke
    Cenario: Nao enviar ofertas para email invalido
        Dado que eu tenha um email invalido
        Quando digitar o email invalido para receber ofertas
        Então devo receber a critica "E-mail inválido, por favor infome um e-mail válidooo"
