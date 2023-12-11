

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}               https://www.amazon.com.br/
${SearchTerm}        A vida pela musica
${product_element}    
*** Test Cases ***
Verificar se um produto está sendo inserido e removido no carrinho da Amazon 
    
    Dado: que eu acesse a página da Amazon
    E: Pesquise um produto na barra de busca
    E: Clique no ícone do produto  
    E: Clique em adicionar ao carrinho 
    E: Clique em ir para o carrinho
    E: Na página do carrinho, clique em Excluir 
    Então: O Item colocado antes será removido do carrinho 
    
   
    
***Keywords***
Dado: que eu acesse a página da Amazon
    Open Browser    ${URL}   browser=Chrome 
    Title Should Be   Amazon.com.br | Tudo pra você, de A a Z.
    Sleep    2s
E: Pesquise um produto na barra de busca
   
     Input Text     id= twotabsearchtextbox    ${SearchTerm}
     Click Button    css=input[type="submit"]
     Title Should Be    Amazon.com.br : A vida pela musica
     Sleep    2s
E:Clique no ícone do produto 
     
     ${product_element}=    Get WebElement    //*[contains(@alt,'A vida pela música')]

     Click Element    ${product_element}
     Title Should Be    A vida pela música | Amazon.com.br
     Sleep    2s
E: Clique em adicionar ao carrinho 
   
    Click Button    id=add-to-cart-button
E: Clique em ir para o carrinho
    
    
    Click Element    id=sw-gtc
    Title Should Be    Carrinho de compras da Amazon.com
     Sleep    2s

E: Na página do carrinho, clique em Excluir 
     
     Click Element    xpath=//input[@value='Excluir'] 
Então: O Item colocado antes será removido do carrinho 
     
    Title Should Be    Carrinho de compras da Amazon.com
     Sleep    2s




















