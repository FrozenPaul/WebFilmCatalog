<#import "parts/common.ftl" as c>

<@c.page>

    ${message?if_exists}

    <div class="col-sm-4"></div>
    <div class="col-sm">
        <div align="center">Добавление фильма</div>
        <form action="/film/edit/addFilm" method="post">
            <div class="form-group">
                <label for="filmname">Название фильма (Обязательно к заполнению)</label>
                <input type="text" class="form-control" id="filmname" name="name">
            </div>
            <div class="form-group">
                <label for="producer">Режиссер</label>
                <input type="text" class="form-control" id="producer" name="producer">
            </div>

            <div class="form-group">
                <label for="genre">Жанр (Обязательно к заполнению)</label>
                <input type="text" class="form-control" id="genre" name="genreName">
            </div>
            <div class="form-group">
                <label for="duration">Продолжительность</label>
                <input type="text" class="form-control" id="duration" name="duration">
            </div>
            <div class="form-group">
                <label for="release_year">Год выхода (Обязательно к заполнению)</label>
                <input type="text" class="form-control" id="release_year" name="release_year">
            </div>
            <div class="form-group">
                <label for="country">Страна (Обязательно к заполнению)</label>
                <input type="text" class="form-control" id="country" name="country">
            </div>

            <div class="form-group">
                <label for="exampleFormControlTextarea1">Описание</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="7"
                          name="description"></textarea>
            </div>

            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <div>
                <button class="btn btn-primary" type="submit">Сохранить</button>
            </div>
        </form>
        <form action="/" method="get">
            <button class="btn btn-primary" type="submit">Назад</button>
        </form>
    </div>
    <div class="col-sm-4"></div>
</@c.page>