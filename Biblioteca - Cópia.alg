algoritmo "Sistema de gestão de uma biblioteca"
// Disciplina  :  [Fundamentos de Programação]
// Professor   : Wilson Paiva
// Funçãoo :
// Autor :
// Data : 24/12/2023
// Secção de Declarações

// emprestar livros
tipo informacao = registro
// informações do livro
titulo: caractere
genero: caractere
autor: caractere
codigo: inteiro
qtd: inteiro
disponivel: logico

// cliente
nomeCliente: caractere
codigoCartao: inteiro

// emprestimo
dataEmprestimo: caractere
dataDevolver: caractere

fimregistro
// 1
// mostrar a lista de livros com o genero e o autor e a qtd
// de livros
procedimento MostrarLivros
var
i: inteiro

inicio
limpatela()
// loop para mostrar apenas livros que existem na lista
escreval("====Livros Que temos====")
para i de 1 ate contador faca
   se(lista_de_livros[i].titulo <> "") entao
      escreval("Autor:", lista_de_livros[i].autor)
      escreval(" -- Titulo: ",lista_de_livros[i].titulo)
      escreval(" -- Genero:",lista_de_livros[i].genero)
      escreval(" -- Codigo:", lista_de_livros[i].codigo)

      // se a qtd for diferente de 0 está disponivel
      // caso não, não está
      se (lista_de_livros[i].qtd <> 0) entao
         lista_de_livros[i].disponivel <- verdadeiro
         // escrever a quantidade e se o livro está disponivel
         escreval("  -- Quantidade:", lista_de_livros[i].qtd)
         escreval(" -- Disponivel: Sim")
      senao
         // escrever a quantidade e se o livro está disponivel
         lista_de_livros[i].disponivel <- falso
         escreval(" -- Quantidade:", lista_de_livros[i].qtd)
         escreval(" -- Disponivel: Não")
      fimse
   fimse
fimpara

fimprocedimento
// 2
// adicionar livros novos
procedimento AdicionarLivros
var
i, j:inteiro
qtd, codigo: inteiro
adicionar: caractere
inicio
limpatela()
// contador do loop principal
i <- 1
escreval("====Adicionar Livro====")
escreva("Quantidade de livros a adicionar: ")
leia(qtd)

// loop para adicionar novos livros
enquanto (qtd <> 0) faca
   // adicionar livros só em espaço vazios
   se (lista_de_livros[i].titulo = "") entao
      escreva("Escreve o titulo: ")
      leia(adicionar)
      se (lista_de_livros[i].titulo = adicionar) entao
         // não faz nada essa condição
      senao
         se (lista_de_livros[i].titulo <> adicionar) entao
            lista_de_livros[i].titulo <- adicionar
            escreva("Adicione o autor: ")
            leia(lista_de_livros[i].autor)
            codigo <- randi(contador)
            repita
               para j de 1 ate contador faca
                  se (lista_de_livros[j].codigo = codigo) entao
                     codigo <- randi(contador)
                  senao
                     lista_de_livros[i].codigo <- codigo
                  fimse
               fimpara
            ate lista_de_livros[i].codigo = codigo
            escreva("Adicione o genero: ")
            leia(lista_de_livros[i].genero)
            escreva("Adicione a quantidade: ")
            leia(lista_de_livros[i].qtd)

         fimse
      fimse
      qtd <- qtd - 1
   fimse
   i <- i + 1

fimenquanto

fimprocedimento

// 3
// aumentar a qtd de um livro já existente na lista
// em espera pra terminar depois
procedimento AumentarQtdLivro

var
qtd, i: inteiro
livro: informacao
titulo: caractere

inicio
limpatela()
MostrarLivros
i <- 1
//funciona <- verdadeiro
escreva("Titulo do livro que deseja aumentar a quantidade: ")
leia(titulo)
escreva("Quantidade a adicionar: ")
leia(qtd)
//enquanto (qtd <> 0) faca
para i de 1 ate contador faca
   se (lista_de_livros[i].titulo = titulo) entao
      lista_de_livros[i].qtd <- lista_de_livros[i].qtd + qtd
   fimse
fimpara

//qtd <- qtd - 1
//fimenquanto

fimprocedimento

// 4
// emprestar livros
procedimento EmprestarLivro

var
titulo, nomeCliente: caractere
i: inteiro
inicio
limpatela()
MostrarLivros
escreva("Livro que deseja emprestar: ")
leia(titulo)
escreva("Nome do cliente: ")
leia(nomeCliente)
para i de 1 ate contador faca
   se (lista_de_livros[i].titulo = titulo) entao
      lista_de_emprestimo[i].titulo <- titulo
      lista_de_emprestimo[i].nomeCliente <- nomeCliente
      lista_de_emprestimo[i].qtd <- lista_de_emprestimo[i].qtd + 1
      lista_de_livros[i].qtd <- lista_de_livros[i].qtd - 1
   fimse
fimpara
fimprocedimento

// 5
// mostrar os livros emprestados e as pessoas que os emprestaram
procedimento LivrosEmprestados

var

i: inteiro

inicio
limpatela()
escreval("Nome: ", "| Livro: ")
para i de 1 ate contador faca
   se (lista_de_emprestimo[i].titulo <> "") entao
      escreval(lista_de_emprestimo[i].nomeCliente, "| |", lista_de_emprestimo[i].titulo)
   fimse

fimpara
fimprocedimento

// 6
// registrar novos cliente
procedimento RegistrarCliente

var
qtd, i, j, codigo: inteiro
nomeCliente: caractere
inicio
limpatela()
i <- 1
escreva("Quantidade de cliente a adicionar: ")
leia(qtd)
enquanto (qtd <> 0) faca

   se (lista_de_cliente[i].nomeCliente = "") entao
      escreva("Nome do cliente a registrar: ")
      leia(nomeCliente)
      lista_de_cliente[i].nomeCliente <- nomeCliente
      codigo <- randi(contador)
      // verificar se o codigo do cliente já existe
      // caso existir, gerar um outro
      repita
         para j de 1 ate contador faca
            se (lista_de_cliente[j].codigoCartao = codigo) entao
               codigo <- randi(contador)
            senao
               lista_de_cliente[i].codigoCartao <- codigo
            fimse
         fimpara
         // nessa condição na posição i(nesse caso o novo cliente)
         // tera um novo codigo
      ate lista_de_cliente[i].codigoCartao = codigo
      qtd <- qtd - 1
   fimse
   escreval("Novo cliente registrado")
   i<- i + 1
fimenquanto
fimprocedimento

// 7
// imprimir a lista de clientes e os seus codigos
procedimento ListaClientes
//nomeCliente: caractere
//codigoCartao: inteiro
var
i: inteiro
inicio
limpatela()
escreval("Lista de clientes")
escreval("Nome | Codigo")
para i de 1 ate contador faca
   se (lista_de_cliente[i].nomeCliente <> "") entao
      escreva(lista_de_cliente[i].nomeCliente, " | ")
      escreval(lista_de_cliente[i].codigoCartao)
   fimse
fimpara
fimprocedimento

// 8
// fazer a devolução dos livros emprestados
// e eliminar eles da lista de emprestimo
procedimento DevolverLivro
var
j, i: inteiro
titulo: caractere
inicio
escreval("Livros emprestados")
LivrosEmprestados
escreva("Titulo do livro que deseja devolver: ")
leia(titulo)
para i de 1 ate contador faca

   se (lista_de_emprestimo[i].titulo = titulo) entao
      para j de 1 ate contador faca
         se (lista_de_livros[j].titulo = titulo) entao
            lista_de_livros[j].qtd <- lista_de_liv<<<Aros[j].qtd + lista_de_emprestimo[i].qtd
            lista_de_emprestimo[i].titulo <- ""
            lista_de_emprestimo[i].nomeCliente <- ""
            escreval("O livro '", titulo, "' foi devolvido")
         fimse
      fimpara
   fimse

fimpara

limpatela()
fimprocedimento

// Algoritmo principal
var
lista_de_emprestimo: vetor[1..4] de informacao
lista_de_livros: vetor[1..4] de informacao
lista_de_cliente: vetor[1..4] de informacao
funcionar: logico
cliente_nome: caractere
livro, cont: caractere
//adicionar: caractere
contador: inteiro
opcao: inteiro
qtd: inteiro

// inicio do programa
inicio
contador <- 4
// clientes
lista_de_cliente[1].nomeCliente <- "Snaik Tavares"
lista_de_cliente[1].codigoCartao <- 12
// alguns livros com as suas informações
lista_de_livros[1].titulo <- "mart"
lista_de_livros[1].genero <- "ficção"
lista_de_livros[1].disponivel <- verdadeiro
lista_de_livros[1].autor <- "Shaki"
lista_de_livros[1].codigo <- 1
lista_de_livros[1].qtd <- 4
lista_de_livros[2].titulo <- "snaik"
lista_de_livros[2].genero <- "fantasia"
lista_de_livros[2].autor <- "Taki"
lista_de_livros[2].codigo <- 2
lista_de_livros[2].disponivel <- verdadeiro
lista_de_livros[2].qtd <- 4
funcionar <- verdadeiro

// clientes
lista_de_cliente[1].nomeCliente <- "Leandro Lucas"
lista_de_cliente[2].codigoCartao <- 12

repita


   escreval("========================")
   escreval("=====SEJA BEM-VINDO=====")
   escreval("====BIBLIOTECA SNAIK====")
   escreval("========================")
   escreval("1 Mostrar livros")
   escreval("2 Adicionar livro")
   escreval("3 Aumentar quantidade de um livro")
   escreval("4 Emprestar livros")
   escreval("5 Mostrar livros emprestados")
   escreval("6 Registrar cliente")
   escreval("7 Lista de clientes")
   escreval("8 Devolver livro")
   escreval("9 Fechar o sistema")
   escreva(":")
   leia(opcao)
   escolha (opcao)
   caso 1
      MostrarLivros
   caso 2
      AdicionarLivros
   caso 3
      AumentarQtdLivro
   caso 4
      EmprestarLivro
   caso 5
      LivrosEmprestados
   caso 6
      RegistrarCliente
   caso 7
      ListaClientes
   caso 8
      DevolverLivro
   caso 9
      interrompa
   fimescolha
   escreva("escreve 'm' ou 'menu' para voltar ao menu")
   escreva("\nEscreva uma outra coisa para fechar o programa")
   leia(cont)
   se(cont <> "m") ou (cont <> "menu") entao
   interrompa
   fimse
   limpatela()
ate funcionar = falso

fimalgoritmo

