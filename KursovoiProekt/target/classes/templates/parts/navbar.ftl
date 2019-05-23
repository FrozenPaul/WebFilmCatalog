<#--<#include "security.ftl">-->

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Каталог Фильмов</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">На главную</a>
            </li>
            <#--                <li class="nav-item">-->
            <#--                    <a class="nav-link" href="/user">Пользователи</a>-->
            <#--                </li>-->
            <#--                <li class="nav-item">-->
            <#--                    <a class="nav-link" href="/film/edit/addFilm/form">Добавить фильм</a>-->
            <#--                </li>-->
        </ul>
        <#--        <form action="/logout" method="post">-->
        <#--            <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
        <#--            <button class="btn btn-primary" type="submit">Выйти</button>-->
        <#--        <@l.logout/>-->
    </div>
</nav>