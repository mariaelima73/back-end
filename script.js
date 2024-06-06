document.addEventListener("DOMContentLoaded", function() {
let entrar = document.getElementById('entrar')
let recuperar = document.getElementById('recuperar')
let registrar = document.getElementById('registrar')
let concluir = document.getElementById('concluir')
let login = document.getElementById('login')
let voltar = document.getElementById('voltar')
let sobre = document.getElementById('sobre')

if (entrar) {
entrar.addEventListener('click', function(){
    location.href = 'sisfsgpe.html'
})}
if (recuperar){
recuperar.addEventListener('click', function(){
    location.href = 'recuperar.html'
})}
if (registrar){
registrar.addEventListener('click', function(){
    location.href = 'registro.html'
})}
if (concluir){
concluir.addEventListener('click', function(){
    location.href = 'login.html'
})}
if (login){
login.addEventListener('click', function(){
    location.href = 'login.html'
})}
if (voltar){
voltar.addEventListener('click', function(){
    location.href = 'index.html'
})}
if (sobre){
sobre.addEventListener('click', function(){
    location.href = 'sobre.html'
})}
})

