Hooks
=====

Проект создан с целью упрощения синхронизации веток различных репозиториев между **gitlab** и **bitbucket**, по средствам Webhooks.

##### Принцип взаимодействия

Gitlab и Bitbucket нстроены таким образом, чтобы отправлять запросы (JSON) на сервер синхронизации:

**http://hooks.dev6.icontextdev.ru**

```
Примечания: за один запрос происходит проверка всех веток репозитория, во избежании рассинхронизации
```

### Синхронизация репозитория:

- поиск репозитория;
- чтение локальных веток каждого хранилища: **Gitlab**, **BitBucket**;
- стягивание изменений каждой ветки и запись в сводный репозиторий;
- определение из какого хранилища пришел запрос на синхронизацию;
- в зависимости от хранилища, производится запись в противоположный:
   - из **Gitlab** в **BitBucket**
   - из **BitBucket** в **Gitlab**


### Настройка

- Каждый репозиторий необходимо настраивать индивидуально, из папки **../hooks/repos/**;
    
    Например:
    
    ```
       git remote add bitbucket git@bitbucket.org:icontext/istat.git
    ```
    ```
       git remote add gitlab git@gitlab.icontextdev.ru:cabinet/cabinet.git
    ```
    
    Зависимости для рабты проекта:
    * git
    * php 7.2
    * nginx
    * composer
        
**Возможность использования синхронизации из командной строки:**

```
./sync.sh "repo_name" "host"
```

**repo_name** - каталок репозитория

**host** - **bitbucket.org** или **gitlab.icontextdev.ru**

#### Установка и настройка

**Важно! Необходимо указать путь к папке, где будут храниться репозитории**

- запустить инсталятор с параметром:

```
./install.sh /var/www/hooks/var/repos/
```