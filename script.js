
let entrar = document.getElementById('entrar')
let recuperar = document.getElementById('recuperar')
let registrar = document.getElementById('registrar')
let login = document.getElementById('login')
let voltar = document.getElementById('voltar')
let sobre = document.getElementById('sobre')

document.addEventListener("DOMContentLoaded", function() {
voltar.addEventListener('click', function () {
    location.href = 'index.html'
})
})

document.addEventListener("DOMContentLoaded", function() {
sobre.addEventListener('click', function() {
    location.href = 'sobre.html'
})

login.addEventListener('click', function () {
    location.href = 'login.html'
})
})

entrar.addEventListener('click', function () {
    location.href = 'sistema.html'
})
recuperar.addEventListener('click', function () {
    location.href = 'recuperar.html'
})
registrar.addEventListener('click', function () {
    location.href = 'registro.html'
})