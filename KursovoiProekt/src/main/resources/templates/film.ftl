<#import "parts/common.ftl" as c>


<@c.page>

    <div>
        <h1>${name} </h1>
    </div>

    <div>
        <figure class="figure">
            <img src="${imagepath?if_exists}" class="figure-img img-fluid rounded">
        </figure>
    </div>
    <div>Режиссер: ${producer} </div>
    <div>Жанр: ${genreid} </div>
    <div>Продолжительность: ${duration}</div>
    <div>Год выхода: ${release_year}</div>
    <div>Страна: ${country}</div>
    <div>

        <h3>Описание:</h3>
        <p>${description}</p>
    </div>

    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Введите комментарий">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Добавить</button>
        </form>
    </div>
    <h3>Список Комментариев(${count}):</h3>
    <#list messages as message>
        <div>
            <span>${message.text}</span>
            <strong>${message.authorName}</strong>
        </div>
    <#else >
        Пока никто не оставил своего комментария, будь первым
    </#list>

</@c.page>