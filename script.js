/*document.addEventListener("DOMContentLoaded", function() {
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
})*/

document.getElementById('form-recuperar').addEventListener('submit', function(){
    let formRecup = document.getElementById('form-recuperar');
    if (formRecup.checkValidity()){
        alert('Email enviado! Por favor verifique sua caixa de spam caso não o encontre.');
        location.href = formRecup.action;
    }
});

document.getElementById('form-login').addEventListener('submit', function(){
    let formLogin = document.getElementById('form-login');
    if (formLogin.checkValidity()){
        location.href = formLogin.action;
    }
});

document.getElementById('form-registrar').addEventListener('submit', function(){
    let formRegis = document.getElementById('form-registrar');
    if (formRegis.checkValidity()){
        alert('Usuário cadastrado, por favor faça o login.');
        location.href = formRegis.action;
    }
});